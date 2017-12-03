function getTimeStr(showDate) {
    var time = "00:00";
    var days = new Array("Sunday","Monday","Tuesday","Wednesday","Thurday","Friday","Satuday");
    var months = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
    var datetime=new Date()
    var day=datetime.getDay()
    var month=datetime.getMonth()
    var date =datetime.getDate()
    var hours = datetime.getHours();
    var minutes = datetime.getMinutes();

    minutes = minutes < 10 ? "0" + minutes: minutes;

    if (showDate)
        return  days[day] + " " + months[month] + " " + date + ", " + hours + ":" + minutes;
    else
        return  hours + ":" + minutes;
}

function numToTime(num) {
   var mins = Math.floor((num%3600)/60);
   var secs = Math.floor((num%60));

   mins = mins < 10 ? "0" + mins : mins;
   secs = secs < 10 ? "0" + secs : secs;

   return mins + ":" + secs;
}
