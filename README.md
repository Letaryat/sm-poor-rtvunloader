# sm-poor-buy
Sourcemod plugin for CSGO Legacy that check if cvar: mp_warmup_pausetimer 0. If it equals to 0, server executes command to unload an RTV plugin. It might be used with PUG plugin if you don't want to be !RTV while match is on-going. That can create some problems.

If you are using PUG by splewis, remember to add:
- In warmup.cfg:
mp_warmup_pausetimer 1