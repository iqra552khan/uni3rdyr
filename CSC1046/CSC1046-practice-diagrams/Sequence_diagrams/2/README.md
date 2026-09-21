# this is in mermaid, the other was in PlantUML

sequenceDiagram
actor Detective
participant Witness
participant Lab

Detectice ->> Witness : Did you see anything unusual?
Witness -->> Detective : A suspicious person near the alley
Detective ->> Lab : Analyse fingerprints
Lab -->> Detective : Match found!

%% notice the syntax differnce in PlantUML and Mermaid 
%% ->> in Mermaid and -> in PUML
%% no quotation marks needed in Mermaid