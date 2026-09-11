"""Small deterministic cell-placement annealer; no electrical changes."""
import math, random
from collections import defaultdict
from common import *

def improve(rows,parts,width,anchors,x0=1419,y0=11,dy=71.5,capacity=429):
    rng=random.Random(512);rows=[list(row) for row in rows]
    byname={p['name']:p for p in parts};inc=defaultdict(set)
    pos={}
    def rowpos(j):
        x=x0[j] if isinstance(x0,list) else x0
        for p in rows[j]:pos[p['name']]=(x+width(p)/2,y0+dy*j+27.5);x+=width(p)
    for j in range(len(rows)):rowpos(j)
    nets=defaultdict(list)
    for p in parts:
        for n in set(p['nets'].values()):
            if n in ('vdd','vss'):continue
            nets[n].append(p['name']);inc[p['name']].add(n)
    def cost(n):
        points=[pos[k] for k in nets[n]]+anchors.get(n,[])
        if len(points)<2:return 0
        xs,ys=zip(*points);w=.25 if n.endswith(('cki','rsti')) else 1
        return w*((max(xs)-min(xs))+1.4*(max(ys)-min(ys)))
    scores={n:cost(n) for n in nets};total=sum(scores.values());initial=total
    capacity=capacity if isinstance(capacity,list) else [capacity]*len(rows)
    used=[sum(width(p) for p in row) for row in rows]
    best=total;bestrows=[list(r) for r in rows];steps=360000
    for step in range(steps):
        j,k=rng.randrange(len(rows)),rng.randrange(len(rows))
        if not rows[j] or not rows[k]:continue
        i,q=rng.randrange(len(rows[j])),rng.randrange(len(rows[k]))
        moving=(j!=k and rng.random()<.25)
        if moving:
            if len(rows[j])<2 or used[k]+width(rows[j][i])>capacity[k]:continue
        elif j!=k:
            delta_width=width(rows[k][q])-width(rows[j][i])
            if used[j]+delta_width>capacity[j] or used[k]-delta_width>capacity[k]:continue
        else:
            if len(rows[j])<2:continue
            i=rng.randrange(len(rows[j])-1);q=i+1
        before={idx:list(rows[idx]) for idx in (j,k)}
        affected=set().union(*(inc[p['name']] for p in rows[j]+rows[k]))
        old=sum(scores[n] for n in affected)
        if moving:rows[k].insert(q,rows[j].pop(i))
        else:rows[j][i],rows[k][q]=rows[k][q],rows[j][i]
        rowpos(j)
        if k!=j:rowpos(k)
        newscore={n:cost(n) for n in affected};delta=sum(newscore.values())-old
        temp=150*(.001**(step/steps))
        if delta<=0 or rng.random()<math.exp(-delta/temp):
            total+=delta;scores.update(newscore)
            if total<best:best=total;bestrows=[list(r) for r in rows]
            for idx in before:used[idx]=sum(width(p) for p in rows[idx])
        else:
            for idx,row in before.items():rows[idx]=row;rowpos(idx)
    print('placement wire estimate',round(initial), '->',round(best),flush=True)
    return bestrows
