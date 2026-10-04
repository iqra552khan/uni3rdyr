The lecture gives us this system:

Riders view live shuttle positions and receive arrival alerts. The driver's phone supplies a position every 20 seconds. An external map service supplies map tiles. Every five minutes, the system recalculates arrival estimates and sends changed alerts.

steps:
1. identify actors - things that interact with the system but are not part of it
- Rider
- Driver's phone
- Maps
- Clock

2. identify use cases - actions that happen within the system
- View shuttle positions
- recieve arrival alert
- report shuttle positon
- update arrival estimates

3. identify any includes (something is necessary for something else) or extends (conditional)
view shuttle positon depends on map tiles/its necessary to have map tiles to view a position