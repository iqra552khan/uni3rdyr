flowchart TB
Start([Start]) --> A[/Enter Username and Password/]
A --> B{Credentials valid?}
B -- No --> D[Show error message] --> A
B -- Yes --> C[log in to system]
C --> E[display welcome message] --> End([end])

%%styles
style B fill:lightblue
style Start fill:lightgreen
style End fill:lightgreen
style A fill:yellow
style D fill:orange
style C fill:orange
style E fill:orange