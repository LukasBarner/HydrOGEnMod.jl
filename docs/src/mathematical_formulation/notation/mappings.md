# Mappings

|Mapping | Explanation |
|--- | --- |
$$\mathcal{A}_e(n)$$ | All transportation arcs $$a$$ that end in node $$n$$. Defined for all $$n \in \mathcal{N}$$.|
$$\mathcal{A}_s(n)$$ | All transportation arcs $$a$$ that start in node $$n$$. Defined for all $$n \in \mathcal{N}$$.|
$$a^{-1}(a)$$ | Arc going in the opposite direction of $$a$$. Defined for all $$a \in \mathcal{A}$$.|
$$n(p)$$ | Mapping each producer $$p$$ to the corresponding node $$n$$. Defined for all $$p \in \mathcal{P}$$.|
$$\mathcal{P}(t,n)$$ | Set containing all domestic producers of trader $$t$$ in node $$n$$. Defined for all $$t \in \mathcal{T}$$, $$n \in \mathcal{N}$$. |
$$\mathcal{N}_p(t)$$ | Set of all production nodes of trader $$t$$. Defined for all $$t \in \mathcal{T}$$.|
$$n(s)$$ | Mapping each storage system operator $$s$$ to the corresponding node $$n$$. Defined for all $$s \in \mathcal{S}$$.|
$$s(n)$$ | Domestic storage system operator of node $$n$$. Defined for all $$n \in \mathcal{N}$$.|
$$v(n)$$ | Domestic converter of node $$n$$. Defined for all $$n \in \mathcal{N}$$.|
$$m^{+}(m)$$ | Time step following $$m$$. The step following the last one is the first, i.e. $$m^{+}(m[end]) = m[1]$$. Defined for all $$m \in \mathcal{M}$$.|
$$m^{-}(m)$$ | Time step preceding  $$m$$. The step preceding the first one is the last, i.e. $$m^{-}(m[1]) = m[end]$$. Defined for all $$m \in \mathcal{M}$$.|
