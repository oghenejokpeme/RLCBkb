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

is_a(A,B):-
    isa(A,B).
is_a(A,C):-
    isa(A,B),
    is_a(B,C).

part_of(A,B):-
    partof(A,B).
part_of(A,B):-
    is_a(A,C),
    partof(C,B).
part_of(A,B):-
    partof(A,C),
    partof(C,B).

has_part(A,B):-
    haspart(A,B).
has_part(A,B):-
    is_a(A,C),
    haspart(C,B).
has_part(A,B):-
    haspart(A,C),
    haspart(C,B).

regulates(A,B):-
    reg(A,B).
regulates(A,B):-
    is_a(A,C),
    reg(C,B).

pos_regulates(A,B):-
    posreg(A,B).
pos_regulates(A,B):-
    is_a(A,C),
    posreg(C,B).
neg_regulates(A,B):-
    negreg(A,B).
neg_regulates(A,B):-
    is_a(A,C),
    negreg(C,B).

compound_id(Compound):-
    drug(Compound).

has_group_count(Compound, Group, Count):-
    compound_id(Compound), 
    has_functional_group(Compound, Group), 
    findall(Group, comp_func_group(Compound, _, Group, _), Ans),
    length(Ans, Count).

has_ring_count(Compound, Ring, Count):-
    compound_id(Compound), 
    has_ring(Compound, Ring), 
    findall(Ring, comp_ring(Compound, _, _, Ring), Ans),
    length(Ans, Count).

drug_drug_(DrugA,DrugB):-
    drug_drug(DrugA,DrugB);
    drug_drug(DrugB,DrugA).
major_sim_(DrugA,DrugB):-
    major_sim(DrugA,DrugB);
    major_sim(DrugB,DrugA).

drug_disease(Drug,Disease):-
    disease_drug(Disease,Drug).
function_disease(Function,Disease):-
    disease_function(Disease,Function).