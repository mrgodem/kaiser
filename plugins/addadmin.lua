do
local function callback(extra, success, result)
    vardump(success)
    cardump(result)
end
    function run(msg, matches)
        if not is_momod or not is_owner then
    return "فقط سودو می تونه یکی رو ادمین کنه نه تو گه!!!"
end
    local user = 'user#id'
    local chat = 'chat#id'..msg.to.id
    chat_add_user(chat, user, callback, false)
    return "ادمین اضافه شد: "..string.gsub(msg.to.print_name, "_", " ")..'['..msg.to.id..']'
end
return {
    patterns ={
        "^([Aa]ddadmin)$"
        "^(ادادمین)$"
        },
    run = run
}
end
