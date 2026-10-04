@startuml
autonumber
actor Detective
participant Witness
participant Lab

Detective -> Witness : Interview

activate Witness
Witness --> Detective : "A suspicious person..."
deactivate Witness

Detective -> Lab : "Analyse the fingerprint"
Lab --> Detective : "Match found"

' --> is a response
'-> is a message
' activate x deactivate x draws a focus bar on a lifeline (means the participant is actively doing something)

@enduml