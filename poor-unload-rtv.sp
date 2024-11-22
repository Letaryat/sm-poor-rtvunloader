#include <sourcemod>
#include <cstrike>
#include <sdktools>
bool warmupOngoing = true;
bool unloaded = false;

public Plugin:myinfo =
{
	name = "RTV-Disablation",
	author = "Letaryat",
	description = "Disabling RTV command after warmup has ended",
	version = "1.0"
}

public void OnPluginStart()
{
	HookEvent("round_start", OnRoundStart);
	RegConsoleCmd("sm_rtv", cmd_respond);
    RegConsoleCmd("sm_siusiak", cmd_siur);

}

public void OnRoundStart(Event event, const char[] name, bool dontBroadcast)
{
    if (GetConVarInt(FindConVar("mp_warmup_pausetimer")) == 0)
    {
        if(unloaded == false)
        {
            ServerCommand("sm plugins unload rockthevote.smx")
            PrintToChatAll("--- Zablokowano RTV w trakcie meczu. ---");
            unloaded = true;
        }
        return;
    }
    else
    {
        if(unloaded == true)
        {
            unloaded = false;
            ServerCommand("sm plugins load rockthevote.smx")
            PrintToChatAll("RTV Odblokowane poniewaz jest rozgrzewka!");
        }
        return;
    }
}

public Action:cmd_siur(client, args)
{
    if(warmupOngoing == true)
    {
    PrintToChatAll("WarmupOnGoing 1 ");
    }
    else
    {
    PrintToChatAll("WarmupOnGoing 0");
    }
    return Plugin_Handled;
}

public Action:cmd_respond(client, args)
{
    if (GetConVarInt(FindConVar("mp_warmup_pausetimer")) == 0)
    {
        PrintToChatAll("Zablokowano RTV w trakcie meczu.");
    }
	return Plugin_Handled;
}

