-- KATZE.SCRIPTS
-- ALL RIGHTS RESERVED

function createRequestContextMenu(userJob, userGrade)
    local contextMenuOptions = {}

    if userJob == 'police' then
        if userGrade == 2 then
            table.insert(contextMenuOptions, {
                title = 'Haft Befehl (Fahndung)',
                icon = 'magnifying-glass',
                event = 'request:warrant',
                args = {}
            })
        end

        if userGrade >= 1 then
            table.insert(contextMenuOptions, {
                title = 'Telefon Ortung',
                icon = 'phone',
                event = 'request:phonelocation',
                args = {}
            })
        end

        if userGrade >= 2 then
            table.insert(contextMenuOptions, {
                title = 'Durchsuchungsbeschluss',
                icon = 'searchengin',
                event = 'request:search',
                args = {}
            })
        end

        if userGrade >= 3 then
            table.insert(contextMenuOptions, {
                title = 'Einstweilige Verfügung',
                icon = 'crosshairs',
                event = 'request:order',
                args = {}
            })
        end

        if userGrade >= 1 then
            table.insert(contextMenuOptions, {
                title = 'Haus Verbot',
                icon = 'house',
                event = 'request:hausverbot',
                args = {}
            })
        end

        if userGrade >= 2 then
            table.insert(contextMenuOptions, {
                title = 'Observation',
                icon = 'binoculars',
                event = 'request:observation',
                args = {}
            })
        end

        if userGrade >= 4 then
            table.insert(contextMenuOptions, {
                title = 'Ziviloperation',
                icon = 'tower-observation',
                event = 'request:ziviloperation',
                args = {}
            })
        end
    end

    lib.registerContext({
        id = 'request',
        title = 'Anfragen',
        options = contextMenuOptions
    })
end


RegisterNetEvent('showcontext')
AddEventHandler('showcontext', function()

    local userJob = ESX.PlayerData.job.name
    local userGrade = ESX.PlayerData.job.grade

    createRequestContextMenu(userjob, userGrade)
    Wait(10)

    lib.showContext('request')

end)
