static Handle g_enemyNamesTimer = null;

void UseCase_ResetEnemyNamesTimer() {
    g_enemyNamesTimer = null;
}

void UseCase_CreateEnemyNamesTimer() {
    g_enemyNamesTimer = CreateTimer(ENEMY_NAMES_TIMER_INTERVAL, UseCaseTimer_EnemyNames, _, ENEMY_NAMES_TIMER_FLAGS);
}

void UseCase_DestroyEnemyNamesTimer() {
    delete g_enemyNamesTimer;
}

public Action UseCaseTimer_EnemyNames(Handle timer) {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            UseCase_TraceEnemyName(client);
        }
    }

    return Plugin_Continue;
}

void UseCase_TraceEnemyName(int client) {
    if (!IsPlayerAlive(client)) {
        return;
    }

    int target = GetClientAimTarget(client);

    if (target == CLIENT_NOT_FOUND) {
        return;
    }

    int clientTeam = GetClientTeam(client);
    int targetTeam = GetClientTeam(target);

    if (clientTeam != targetTeam) {
        int health = GetClientHealth(target);

        MessageCenterText_EnemyName(client, target, health);
    }
}
