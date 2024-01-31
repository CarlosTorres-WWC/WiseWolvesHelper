/***
 * @class: AbbreviateAddress.
 * @description: this class provides a method that abbreviates addresses.
 *  INPUT 2nd Street East, Apartment A -> OUTPUT -> 2nd St E, Apt A.
 *
 */
public class AbbreviateAddress {

    /**
     * @name formattedProjectStreetAbb.
     * @description: abbreviate an given address.
     * @param {String} StreetAddress to be abbreviated.
     * @return {String} Abbreviated Address.
     */
    public static string formattedProjectStreetAbb(String street){
        if(String.isBlank(street))
           return street;
       String[] words = street.split(' ');
       String result = '';
       for(String word : words) {
           String uppercaseWord = word.toUpperCase();
           if (wordMappings.containsKey(uppercaseWord)) {
               result += wordMappings.get(uppercaseWord) + ' ';
           } else {
               result += word.substring(0, 1).toUpperCase() + word.substring(1) + ' ';
           }
       }
       result = result.trim();
       return result;
   }
   
   private static Map<String, String> wordMappings = new Map<String, String>{
       'APARTMENT' => 'Apt',
       'BUILDING' => 'Bldg',
       'FLOOR' => 'Flr',
       'ROOM' => 'Rm',
       'SUITE' => 'Ste',
       'ALLEY' => 'Aly',
       'AVENUE' => 'Ave',
       'BOULEVARD' => 'Blvd',
       'CAUSEWAY' => 'Cswy',
       'CENTER' => 'Ctr',
       'CIRCLE' => 'Cir',
       'COURT' => 'Ct',
       'COVE' => 'Cv',
       'DRIVE' => 'Dr',
       'LANE' => 'Ln',
       'PARKWAY' => 'Pkwy',
       'PLACE' => 'Pl',
       'PLAZA' => 'Plz',
       'POINT' => 'Pt',
       'ROAD' => 'Rd',
       'ROUTE' => 'Rte',
       'SQUARE' => 'Sq',
       'STREET' => 'St',
       'TERRACE' => 'Ter',
       'TRAIL' => 'Trl',
       'NORTH' => 'N',
       'NORTHEAST' => 'NE',
       'NORTHWEST' => 'NW',
       'SOUTH' => 'S',
       'SOUTHEAST' => 'SE',
       'SOUTHWEST' => 'SW',
       'EAST' => 'E',
       'WEST' => 'W'
   };
}