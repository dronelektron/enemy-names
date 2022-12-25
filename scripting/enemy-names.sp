#include <sourcemod>
#include <sdktools>

#include "en/use-case"

#include "modules/message.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Enemy names",
    author = "Dron-elektron",
    description = "Allows you to see the names of enemies at the end of the round",
    version = "1.0.0",
    url = "https://github.com/dronelektron/enemy-names"
};

public void OnPluginStart() {
    HookEvent("dod_round_start", Event_RoundStart);
    HookEvent("dod_round_win", Event_RoundWin);
    LoadTranslations("enemy-names.phrases");
}

public void Event_RoundStart(Event event, const char[] name, bool dontBroadcast) {
    UseCase_DestroyEnemyNamesTimer();
}

public void Event_RoundWin(Event event, const char[] name, bool dontBroadcast) {
    UseCase_CreateEnemyNamesTimer();
}
