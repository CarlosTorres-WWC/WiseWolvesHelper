public class timeHelperGMT(){
    public static DateTime convertDateTimeWithTimeZoneToGMT(String dateTimeStr, String timeZoneSuffix) {
        // Parse the date and time parts from the input string
        String[] parts = dateTimeStr.split(' ');
        String datePart = parts[0]; // '2024-02-08'
        String timePart = parts[1]; // '14:33'
        
        // Split the date and time into components
        String[] dateComponents = datePart.split('-');
        Integer year = Integer.valueOf(dateComponents[0]);
        Integer month = Integer.valueOf(dateComponents[1]);
        Integer day = Integer.valueOf(dateComponents[2]);
        
        String[] timeComponents = timePart.split(':');
        Integer hour = Integer.valueOf(timeComponents[0]);
        Integer minute = Integer.valueOf(timeComponents[1]);
        
        // Create a DateTime object using the parsed components
        DateTime localDateTime = DateTime.newInstanceGmt(
            Date.newInstance(year, month, day),
            Time.newInstance(hour, minute, 0, 0)
        );
        
        // Adjust for the time zone to GMT
        TimeZone tz = TimeZone.getTimeZone(timeZoneSuffix);
        Integer offsetToGMT = tz.getOffset(localDateTime) / 1000; // Offset in seconds
        DateTime gmtDateTime = localDateTime.addSeconds(-offsetToGMT);
        
        return gmtDateTime;
    }
}
