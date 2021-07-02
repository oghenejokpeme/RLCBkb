:- set(i,20).
:- set(clauselength,20).
:- set(search,ar).
:- set(pos_fraction,0.05).
:- set(max_features,1025).
:- set(noise,inf).
:- set(nodes,5000).

:- modeh(1, networked(+drug)).
:- modeb(1, drug_drug_(+drug, -drug)).
:- modeb(1, drug_disease(+drug, -disease)). 
:- modeb(1, disease_function(+disease, -function)).
:- modeb(*, drug_gene(+drug, -gene)).
:- modeb(*, gene_function(+gene, -function)). 
:- modeb(*, has_functional_group(+drug, #group)).
:- modeb(*, has_ring(+drug, #ringtype)).
:- modeb(*, has_group_count(+drug, #group, #count)).
:- modeb(*, has_ring_count(+drug, #ringtype, #count)).
:- modeb(*, has_group_ring_attachment(+drug, #group, #ringtype)).
:- modeb(*, is_a(+function, #function)).
:- modeb(*, part_of(+function, #function)).
:- modeb(*, has_part(+function, #function)).
:- modeb(*, regulates(+function, #function)).
:- modeb(*, neg_regulates(+function, #function)).
:- modeb(*, pos_regulates(+function, #function)).

:- determination(networked/1, drug_drug_/2).
:- determination(networked/1, drug_gene/2).
:- determination(networked/1, gene_function/2).
:- determination(networked/1, drug_disease/2).
:- determination(networked/1, disease_function/2).
:- determination(networked/1, has_functional_group/2).
:- determination(networked/1, has_ring/2).
:- determination(networked/1, has_group_count/3).
:- determination(networked/1, has_ring_count/3).
:- determination(networked/1, has_group_ring_attachment/3).
:- determination(networked/1, is_a/2).
:- determination(networked/1, part_of/2).
:- determination(networked/1, has_part/2).
:- determination(networked/1, regulates/2).
:- determination(networked/1, neg_regulates/2).
:- determination(networked/1, pos_regulates/2).

:- ['main.pl'].
