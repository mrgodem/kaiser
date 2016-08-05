local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '"'..#result..'"تعداد پیام هایی که گفتید به طور کاملا طبیعی منفجر شد', ok_cb, false)
  else
    send_msg(extra.chatid, 'تعداد پیام هایی که گفتید به طور کاملا طبیعی منفجر شد!!!', ok_cb, false)
  end
end
local function run(msg, matches)
  if matches[1] == 'rmsg' and is_owner(msg) then
    if msg.to.type == 'channel' then
      if tonumber(matches[2]) > 10000 or tonumber(matches[2]) < 1 then
        return "دیگه خیلی گشادی این یه دونه رو خودت پاک کن"
      end
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
    else
      return "فقط در سوپرگروه ممکن است"
    end
  else
    return "شما هیچی نیستید نمی توانید پیام هارا پاک کنید"
  end
end

return {
    patterns = {
        '^[!/#](rmsg) (%d*)$'
    },
    run = run
}
