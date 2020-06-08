:- ['main_kb/drug_sim.pl'].
:- ['main_kb/drug_structures.pl'].
:- ['main_kb/entities.pl'].
:- ['main_kb/gene_ontology.pl'].
:- ['main_kb/network.pl'].
:- ['pharmacophores/functional_groups.pl'].
:- ['pharmacophores/group_count.pl'].
:- ['pharmacophores/group_ring.pl'].
:- ['pharmacophores/ring_count.pl'].
:- ['pharmacophores/rings.pl'].

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
