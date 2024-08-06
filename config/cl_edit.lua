function ShowNotification(message, notifyType)
    lib.notify({
        description = message,
        type = notifyType,
    })
end

RegisterNetEvent('lunar_fishing:showNotification')
AddEventHandler('lunar_fishing:showNotification', ShowNotification)

function ShowUI(text, icon)
    if icon == 0 then
        lib.showTextUI(text)
        position = 'left-center'
    else
        lib.showTextUI(text, {
            position = 'left-center',
            icon = icon
        })
    end
end

function HideUI()
    lib.hideTextUI()
end

function ShowProgressBar(text, duration, canCancel, anim, prop)
    return lib.progressBar({
        duration = duration,
        label = text,
        useWhileDead = false,
        canCancel = canCancel,
        disable = {
            car = true,
            move = true,
            combat = true
        },
        anim = anim,
        prop = prop
    })
end

local function isStarted(resourceName)
    return GetResourceState(resourceName) == 'started'
end

---@type string
local path

if isStarted('ox_inventory') then
    path = 'nui://ox_inventory/web/images/%s.png'
elseif isStarted('qb-inventory') then
    path = 'nui://qb-inventory/html/images/%s.png'
elseif isStarted('ps-inventory') then
    path = 'nui://ps-inventory/html/images/%s.png'
elseif isStarted('lj-inventory') then
    path = 'nui://lj-inventory/html/images/%s.png'
elseif isStarted('qs-inventory') then
    path = 'nui://qs-inventory/html/images/%s.png' -- Not really sure
end

---Returns the NUI path of an icon.
---@param itemName string
---@return string?
---@diagnostic disable-next-line: duplicate-set-field
function GetInventoryIcon(itemName)
    if not path then
        warn('Inventory images path not set in cl_edit.lua!')
        return
    end

    return path:format(itemName) .. '?height=128'
end
