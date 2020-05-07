//
//  BureauOfLaborStatistics.swift
//  Prospective_Job_App
//
//  Created by Jeff Turley on 5/6/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import Foundation

//
//  BureauOfLaborStatistics.swift
//  Prospective_Job_App
//
//  Created by Jeff Turley on 4/30/20.
//  Copyright © 2020 ilstu.edu. All rights reserved.
//

import Foundation

enum AdjCode: String, CaseIterable{
    case adjusted = "S"
    case unadjusted = "U"
    
    static var allCases: [AdjCode]{
        return [.adjusted, .unadjusted]
    }
}

var stateAbrevsDic = ["Alabama": "AL",
    "Alaska": "AK",
    "Arizona": "AZ",
    "Arkansas": "AR",
    "California": "CA",
    "Colorado": "CO",
    "Connecticut": "CT",
    "Delaware": "DE",
    "Florida": "FL",
    "Georgia": "GA",
    "Hawaii": "HI",
    "Idaho": "ID",
    "Illinois": "IL",
    "Indiana": "IN",
    "Iowa": "IA",
    "Kansas": "KS",
    "Kentucky": "KY",
    "Louisiana": "LA",
    "Maine": "ME",
    "Maryland": "MD",
    "Massachusetts": "MA",
    "Michigan": "MI",
    "Minnesota": "MN",
    "Mississippi": "MS",
    "Missouri": "MO",
    "Montana": "MT",
    "Nebraska": "NE",
    "Nevada": "NV",
    "New Hampshire": "NH",
    "New Jersey": "NJ",
    "New Mexico": "NM",
    "New York": "NY",
    "North Carolina": "NC",
    "North Dakota": "ND",
    "Ohio": "OH",
    "Oklahoma": "OK",
    "Oregon": "OR",
    "Pennsylvania": "PA",
    "Rhode Island": "RI",
    "South Carolina": "SC",
    "South Dakota": "SD",
    "Tennessee": "TN",
    "Texas": "TX",
    "Utah": "UT",
    "Vermont": "VT",
    "Virginia": "VA",
    "Washington": "WA",
    "West Virginia": "WV",
    "Wisconsin": "WI",
    "Wyoming": "WY"]

let stateCodesDic = ["Alabama" : "01",
    "Alaska" : "02",
    "Arizona" : "04",
    "Arkansas" : "05",
    "California":"06",
    "Colorado" : "08",
    "Connecticut" : "09",
    "Delaware" : "10",
    "District of Columbia" : "11",
    "Florida" : "12",
    "Georgia" : "13",
    "Hawaii" : "15",
    "Idaho" : "16",
    "Illinois" : "17",
    "Indiana" : "18",
    "Iowa" : "19",
    "Kansas" : "20",
    "Kentucky" : "21",
    "Louisiana" : "22",
    "Maine" : "23",
    "Maryland" : "24",
    "Massachusetts" : "25",
    "Michigan" : "26",
    "Minnesota" : "27",
    "Mississippi" : "28",
    "Missouri" : "29",
    "Montana" : "30",
    "Nebraska" : "31",
    "Nevada" : "32",
    "New Hampshire" : "33",
    "New Jersey" : "34",
    "New Mexico" : "35",
    "New York" : "36",
    "North Carolina" : "37",
    "North Dakota" : "38",
    "Ohio" : "39",
    "Oklahoma" : "40",
    "Oregon" : "41",
    "Pennsylvania" : "42",
    "Rhode Island" : "44",
    "South Carolina" : "45",
    "South Dakota" : "46",
    "Tennessee" : "47",
    "Texas" : "48",
    "Utah" : "49",
    "Vermont" : "50",
    "Virginia" : "51",
    "Washington" : "53",
    "West Virginia" : "54",
    "Wisconsin" : "55",
    "Wyoming" : "56",
    "Puerto Rico" : "72",
    "Virgin Islands" : "78"]

let stateAreaCodesDic = ["WI": ["Appleton": "11540", "Janesville-Beloit": "27500", "Milwaukee-Waukesha-West Allis": "33340", "Minneapolis-St. Paul-Bloomington": "33460", "Madison": "31540", "Fond du Lac": "22540", "Sheboygan": "43100", "La Crosse-Onalaska": "29100", "Racine": "39540", "Green Bay": "24580", "Duluth": "20260", "Eau Claire": "20740", "Wausau": "48140", "Oshkosh-Neenah": "36780", "Chicago-Naperville-Elgin": "16980", "Lake County-Kenosha County": "29404"],
"VT": ["Burlington-South Burlington": "72400"],
"UT": ["Salt Lake City": "41620", "Logan": "30860", "St. George": "41100", "Provo-Orem": "39340", "Ogden-Clearfield": "36260"],
"GA": ["Atlanta-Sandy Springs-Roswell": "12060", "Columbus": "17980", "Albany": "10500", "Warner Robins": "47580", "Brunswick": "15260", "Macon-Bibb County": "31420", "Rome": "40660", "Hinesville": "25980", "Savannah": "42340", "Athens-Clarke County": "12020", "Gainesville": "23580", "Augusta-Richmond County": "12260", "Dalton": "19140", "Valdosta": "46660", "Chattanooga": "16860"],
"MN": ["Mankato-North Mankato": "31860", "La Crosse-Onalaska": "29100", "Fargo": "22020", "Rochester": "40340", "Duluth": "20260", "Minneapolis-St. Paul-Bloomington": "33460", "St. Cloud": "41060", "Grand Forks": "24220"],
"NJ": ["Trenton": "45940", "Allentown-Bethlehem-Easton": "10900", "Bergen-Hudson-Passaic": "93563", "Camden": "15804", "Ocean City": "36140", "Atlantic City-Hammonton": "12100", "Vineland-Bridgeton": "47220", "Newark": "35084", "New York-Jersey City-White Plains": "35614", "New York-Newark-Jersey City": "35620", "Philadelphia-Camden-Wilmington": "37980", "Wilmington": "48864", "Middlesex-Monmouth-Ocean": "93565"],
"MT": ["Missoula": "33540", "Billings": "13740", "Great Falls": "24500"],
"ID": ["Boise City": "14260", "Twin Falls": "46300", "Lewiston": "30300", "Pocatello": "38540", "Coeur d\'Alene": "17660", "Logan": "30860", "Idaho Falls": "26820"],
"AZ": ["Lake Havasu City-Kingman": "29420", "Yuma": "49740", "Prescott": "39140", "Sierra Vista-Douglas": "43420", "Phoenix-Mesa-Scottsdale": "38060", "Flagstaff": "22380", "Tucson": "46060"],
"FL": ["Homosassa Springs": "26140", "Fort Lauderdale-Pompano Beach-Deerfield Beach": "22744", "Miami-Fort Lauderdale-West Palm Beach": "33100", "Panama City": "37460", "Crestview-Fort Walton Beach-Destin": "18880", "Cape Coral-Fort Myers": "15980", "Sebastian-Vero Beach": "42680", "West Palm Beach-Boca Raton-Delray Beach": "48424", "Naples-Immokalee-Marco Island": "34940", "Miami-Miami Beach-Kendall": "33124", "Tampa-St. Petersburg-Clearwater": "45300", "The Villages": "45540", "Punta Gorda": "39460", "Tallahassee": "45220", "Orlando-Kissimmee-Sanford": "36740", "Pensacola-Ferry Pass-Brent": "37860", "Deltona-Daytona Beach-Ormond Beach": "19660", "Lakeland-Winter Haven": "29460", "Palm Bay-Melbourne-Titusville": "37340", "Port St. Lucie": "38940", "Jacksonville": "27260", "Sebring": "42700", "Ocala": "36100", "Gainesville": "23540", "North Port-Sarasota-Bradenton": "35840"],
"NE": ["Omaha-Council Bluffs": "36540", "Grand Island": "24260", "Sioux City": "43580", "Lincoln": "30700"],
"AR": ["Texarkana": "45500", "Fayetteville-Springdale-Rogers": "22220", "Fort Smith": "22900", "Jonesboro": "27860", "Hot Springs": "26300", "Memphis": "32820", "Little Rock-North Little Rock-Conway": "30780", "Pine Bluff": "38220"],
"MI": ["Kalamazoo-Portage": "28020", "Lansing-East Lansing": "29620", "Bay City": "13020", "Detroit-Dearborn-Livonia": "19804", "Niles-Benton Harbor": "35660", "Muskegon": "34740", "Jackson": "27100", "Grand Rapids-Wyoming": "24340", "Flint": "22420", "Detroit-Warren-Dearborn": "19820", "Battle Creek": "12980", "Saginaw": "40980", "Warren-Troy-Farmington Hills": "47664", "Monroe": "33780", "Ann Arbor": "11460", "South Bend-Mishawaka": "43780", "Midland": "33220"],
"TX": ["Amarillo": "11100", "Corpus Christi": "18580", "San Angelo": "41660", "Dallas-Plano-Irving": "19124", "Victoria": "47020", "Wichita Falls": "48660", "Texarkana": "45500", "Odessa": "36220", "Beaumont-Port Arthur": "13140", "College Station-Bryan": "17780", "El Paso": "21340", "Brownsville-Harlingen": "15180", "Laredo": "29700", "San Antonio-New Braunfels": "41700", "Waco": "47380", "Longview": "30980", "Lubbock": "31180", "Fort Worth-Arlington": "23104", "Killeen-Temple": "28660", "McAllen-Edinburg-Mission": "32580", "Midland": "33260", "Houston-The Woodlands-Sugar Land": "26420", "Tyler": "46340", "Dallas-Fort Worth-Arlington": "19100", "Abilene": "10180", "Sherman-Denison": "43300", "Austin-Round Rock": "12420"],
"WA": ["Lewiston": "30300", "Portland-Vancouver-Hillsboro": "38900", "Tacoma-Lakewood": "45104", "Seattle-Tacoma-Bellevue": "42660", "Longview": "31020", "Olympia-Tumwater": "36500", "Bremerton-Silverdale": "14740", "Bellingham": "13380", "Seattle-Bellevue-Everett": "42644", "Spokane-Spokane Valley": "44060", "Yakima": "49420", "Mount Vernon-Anacortes": "34580", "Wenatchee": "48300", "Walla Walla": "47460", "Kennewick-Richland": "28420"],
"OR": ["Bend-Redmond": "13460", "Eugene": "21660", "Medford": "32780", "Albany": "10540", "Corvallis": "18700", "Grants Pass": "24420", "Portland-Vancouver-Hillsboro": "38900", "Salem": "41420"],
"DE": ["Wilmington": "48864", "Salisbury": "41540", "Dover": "20100", "Philadelphia-Camden-Wilmington": "37980"],
"HI": ["Kahului-Wailuku-Lahaina": "27980", "Urban Honolulu": "46520"],
"NC": ["Hickory-Lenoir-Morganton": "25860", "Myrtle Beach-Conway-North Myrtle Beach": "34820", "Rocky Mount": "40580", "Durham-Chapel Hill": "20500", "Charlotte-Concord-Gastonia": "16740", "New Bern": "35100", "Asheville": "11700", "Jacksonville": "27340", "Greensboro-High Point": "24660", "Virginia Beach-Norfolk-Newport News": "47260", "Raleigh": "39580", "Wilmington": "48900", "Greenville": "24780", "Fayetteville": "22180", "Goldsboro": "24140", "Winston-Salem": "49180", "Burlington": "15500"],
"NH": ["Nashua": "75404", "Dover-Durham": "73050", "Lawrence-Methuen Town-Salem": "74204", "Boston-Cambridge-Nashua": "71650", "Haverhill-Newburyport-Amesbury Town": "73604", "Lowell-Billerica-Chelmsford": "74804", "Portsmouth": "76900", "Manchester": "74950"],
"NV": ["Carson City": "16180", "Reno": "39900", "Las Vegas-Henderson-Paradise": "29820"],
"ND": ["Fargo": "22020", "Grand Forks": "24220", "Bismarck": "13900"],
"MD": ["Silver Spring-Frederick-Rockville": "43524", "Washington-Arlington-Alexandria": "47900", "Cumberland": "19060", "Wilmington": "48864", "Calvert-Charles-Prince George\'s": "94781", "Hagerstown-Martinsburg": "25180", "Baltimore City": "92581", "California-Lexington Park": "15680", "Salisbury": "41540", "Baltimore-Columbia-Towson": "12580", "Philadelphia-Camden-Wilmington": "37980"],
"MO": ["Columbia": "17860", "Joplin": "27900", "St. Joseph": "41140", "Cape Girardeau": "16020", "St. Louis": "41180", "Springfield": "44180", "Jefferson City": "27620", "Kansas City": "92811", "Fayetteville-Springdale-Rogers": "22220"],
"MA": ["Barnstable Town": "70900", "Nashua": "75404", "Pittsfield": "76600", "Lowell-Billerica-Chelmsford": "74804", "New Bedford": "75550", "Boston-Cambridge-Nashua": "71650", "Haverhill-Newburyport-Amesbury Town": "73604", "Leominster-Gardner": "74500", "Taunton-Middleborough-Norton": "78254", "Lynn-Saugus-Marblehead": "74854", "Lawrence-Methuen Town-Salem": "74204", "Framingham": "73104", "Brockton-Bridgewater-Easton": "72104", "Springfield": "78100", "Peabody-Salem-Beverly": "76524", "Worcester": "79600", "Providence-Warwick": "77200", "Boston-Cambridge-Newton": "71654"],
"KS": ["Manhattan": "31740", "Lawrence": "29940", "Kansas City": "92812", "Topeka": "45820", "St. Joseph": "41140", "Wichita": "48620"],
"ME": ["Lewiston-Auburn": "74650", "Bangor": "70750", "Dover-Durham": "73050", "Portsmouth": "76900", "Portland-South Portland": "76750"],
"VA": ["Harrisonburg": "25500", "Kingsport-Bristol-Bristol": "28700", "Roanoke": "40220", "Blacksburg-Christiansburg-Radford": "13980", "Charlottesville": "16820", "Lynchburg": "31340", "Winchester": "49020", "Richmond": "40060", "Virginia Beach-Norfolk-Newport News": "47260", "Northern Virginia": "94783", "Washington-Arlington-Alexandria": "47900", "Staunton-Waynesboro": "44420"],
"PA": ["Allentown-Bethlehem-Easton": "10900", "East Stroudsburg": "20700", "Delaware County": "97962", "Montgomery County-Bucks County-Chester County": "33874", "Lebanon": "30140", "Harrisburg-Carlisle": "25420", "Lancaster": "29540", "State College": "44300", "Philadelphia-Camden-Wilmington": "37980", "Pittsburgh": "38300", "Johnstown": "27780", "Philadelphia": "37964", "Gettysburg": "23900", "Newark": "35084", "Altoona": "11020", "Erie": "21500", "Chambersburg-Waynesboro": "16540", "Reading": "39740", "Scranton--Wilkes-Barre--Hazleton": "42540", "Bloomsburg-Berwick": "14100", "York-Hanover": "49620", "Philadelphia City": "97961", "Youngstown-Warren-Boardman": "49660", "New York-Newark-Jersey City": "35620", "Williamsport": "48700"],
"NY": ["Albany-Schenectady-Troy": "10580", "New York-Jersey City-White Plains": "35614", "Nassau County-Suffolk County": "35004", "Elmira": "21300", "Syracuse": "45060", "Glens Falls": "24020", "Ithaca": "27060", "Kingston": "28740", "New York-Newark-Jersey City": "35620", "Buffalo-Cheektowaga-Niagara Falls": "15380", "Dutchess County-Putnam County": "20524", "Binghamton": "13780", "Utica-Rome": "46540", "Orange-Rockland-Westchester": "93562", "New York City": "93561", "Watertown-Fort Drum": "48060", "Rochester": "40380"],
"WV": ["Morgantown": "34060", "Parkersburg-Vienna": "37620", "Weirton-Steubenville": "48260", "Beckley": "13220", "Hagerstown-Martinsburg": "25180", "Washington-Arlington-Alexandria": "47900", "Charleston": "16620", "Wheeling": "48540", "Winchester": "49020", "Huntington-Ashland": "26580", "Cumberland": "19060"],
"IA": ["Iowa City": "26980", "Des Moines-West Des Moines": "19780", "Cedar Rapids": "16300", "Davenport-Moline-Rock Island": "19340", "Sioux City": "43580", "Ames": "11180", "Dubuque": "20220", "Omaha-Council Bluffs": "36540", "Waterloo-Cedar Falls": "47940"],
"CT": ["Worcester": "79600", "New Haven": "75700", "Waterbury": "78700", "Hartford-West Hartford-East Hartford": "73450", "Bridgeport-Stamford-Norwalk": "71950", "Danbury": "72850", "Springfield": "78100", "Norwich-New London-Westerly": "76450"],
"WY": ["Casper": "16220", "Cheyenne": "16940"],
"OH": ["Cincinnati": "17140", "Canton-Massillon": "15940", "Toledo": "45780", "Columbus": "18140", "Mansfield": "31900", "Dayton": "19380", "Cleveland-Elyria": "17460", "Springfield": "44220", "Wheeling": "48540", "Huntington-Ashland": "26580", "Weirton-Steubenville": "48260", "Youngstown-Warren-Boardman": "49660", "Lima": "30620", "Akron": "10420"],
"IN": ["Chicago-Naperville-Elgin": "16980", "Indianapolis-Carmel-Anderson": "26900", "Michigan City-La Porte": "33140", "Fort Wayne": "23060", "Columbus": "18020", "Evansville": "21780", "Gary": "23844", "Louisville/Jefferson County": "31140", "Bloomington": "14020", "Kokomo": "29020", "Lafayette-West Lafayette": "29200", "Elkhart-Goshen": "21140", "Muncie": "34620", "South Bend-Mishawaka": "43780", "Cincinnati": "17140", "Terre Haute": "45460"],
"AL": ["Columbus": "17980", "Montgomery": "33860", "Mobile": "33660", "Anniston-Oxford-Jacksonville": "11500", "Daphne-Fairhope-Foley": "19300", "Tuscaloosa": "46220", "Florence-Muscle Shoals": "22520", "Dothan": "20020", "Birmingham-Hoover": "13820", "Gadsden": "23460", "Decatur": "19460", "Auburn-Opelika": "12220", "Huntsville": "26620"],
"CA": ["Madera": "31460", "Modesto": "33700", "San Francisco-Oakland-Hayward": "41860", "San Francisco-Redwood City-South San Francisco": "41884", "Salinas": "41500", "El Centro": "20940", "San Rafael": "42034", "San Luis Obispo-Paso Robles-Arroyo Grande": "42020", "San Jose-Sunnyvale-Santa Clara": "41940", "Redding": "39820", "Los Angeles-Long Beach-Anaheim": "31080", "Merced": "32900", "Riverside-San Bernardino-Ontario": "40140", "San Diego-Carlsbad": "41740", "Oxnard-Thousand Oaks-Ventura": "37100", "Santa Maria-Santa Barbara": "42200", "Fresno": "23420", "Los Angeles-Long Beach-Glendale": "31084", "Oakland-Hayward-Berkeley": "36084", "Napa": "34900", "Santa Cruz-Watsonville": "42100", "Yuba City": "49700", "Vallejo-Fairfield": "46700", "Hanford-Corcoran": "25260", "Santa Rosa": "42220", "Chico": "17020", "Visalia-Porterville": "47300", "Sacramento--Roseville--Arden-Arcade": "40900", "Anaheim-Santa Ana-Irvine": "11244", "Stockton-Lodi": "44700", "Bakersfield": "12540"],
"LA": ["Baton Rouge": "12940", "Lafayette": "29180", "New Orleans-Metairie": "35380", "Shreveport-Bossier City": "43340", "Hammond": "25220", "Lake Charles": "29340", "Houma-Thibodaux": "26380", "Alexandria": "10780", "Monroe": "33740"],
"NM": ["Albuquerque": "10740", "Santa Fe": "42140", "Farmington": "22140", "Las Cruces": "29740"],
"KY": ["Bowling Green": "14540", "Evansville": "21780", "Owensboro": "36980", "Huntington-Ashland": "26580", "Clarksville": "17300", "Lexington-Fayette": "30460", "Louisville/Jefferson County": "31140", "Cincinnati": "17140", "Elizabethtown-Fort Knox": "21060"],
"CO": ["Denver-Aurora-Lakewood": "19740", "Colorado Springs": "17820", "Fort Collins": "22660", "Pueblo": "39380", "Grand Junction": "24300", "Greeley": "24540", "Boulder": "14500"],
"TN": ["Johnson City": "27740", "Memphis": "32820", "Knoxville": "28940", "Jackson": "27180", "Morristown": "34100", "Cleveland": "17420", "Kingsport-Bristol-Bristol": "28700", "Nashville-Davidson--Murfreesboro--Franklin": "34980", "Chattanooga": "16860", "Clarksville": "17300"],
"SC": ["Myrtle Beach-Conway-North Myrtle Beach": "34820", "Spartanburg": "43900", "Florence": "22500", "Columbia": "17900", "Hilton Head Island-Bluffton-Beaufort": "25940", "Sumter": "44940", "Augusta-Richmond County": "12260", "Charlotte-Concord-Gastonia": "16740", "Greenville-Anderson-Mauldin": "24860", "Charleston-North Charleston": "16700"],
"IL": ["Kankakee": "28100", "Elgin": "20994", "Cape Girardeau": "16020", "Rockford": "40420", "Peoria": "37900", "Springfield": "44100", "Danville": "19180", "Lake County-Kenosha County": "29404", "Bloomington": "14010", "Davenport-Moline-Rock Island": "19340", "Decatur": "19500", "St. Louis": "41180", "Chicago-Naperville-Arlington Heights": "16974", "Chicago-Naperville-Elgin": "16980", "Champaign-Urbana": "16580", "Carbondale-Marion": "16060"],
"RI": ["Providence-Warwick": "77200", "Norwich-New London-Westerly": "76450"],
"MS": ["Gulfport-Biloxi-Pascagoula": "25060", "Hattiesburg": "25620", "Jackson": "27140", "Memphis": "32820"],
"AK": ["Fairbanks": "21820", "Anchorage": "11260"],
"SD": ["Rapid City": "39660", "Sioux City": "43580", "Sioux Falls": "43620"],
"OK": ["Lawton": "30020", "Enid": "21420", "Fort Smith": "22900", "Tulsa": "46140", "Oklahoma City": "36420"]]

let industryCodeDic_d6 = [
    "Total nonfarm": "000000",
    "Total private" : "100000",
    "Mining and logging": "110099",
    "Construction": "230000",
    "Manufacturing": "300000",
    "Durable goods manufacturing": "320000",
    "Nondurable goods manufacturing": "340000",
    "Trade, transportation, and utilities": "400000",
    "Wholesale trade": "420000",
    "Retail trade": "440000",
    "Transportation, warehousing, and utilities": "480099",
    "Information": "510000",
    "Financial activities": "510099",
    "Finance and insurance": "520000",
    "Real estate and rental and leasing": "530000",
    "Professional and business services": "540099",
    "Education and health services": "600000",
    "Educational services": "610000",
    "Health care and social assistance": "620000",
    "Leisure and hospitality": "700000",
    "Arts, entertainment, and recreation": "710000",
    "Accommodation and food services": "720000",
    "Other services": "810000",
    "Government": "900000",
    "Federal": "910000",
    "State and local": "920000",
    "State and local government education": "923000",
    "State and local government, excluding education": "929000"]

let industryCodeDic_d8 = ["Testing laboratories": "60541380", "Securities, commodity contracts, investments, and funds and trusts": "55523000", "Other activities related to real estate": "55531390", "Semiconductors and electronic components": "31334400", "Assisted living facilities for the elderly": "65623312", "Commercial machinery repair and maintenance": "80811300", "Home health care services": "65621600", "Electrical equipment": "31335300", "Other miscellaneous nondurable goods manufacturing": "32329900", "Other technical consulting services": "60541690", "Skiing facilities": "70713920", "Wood windows and doors": "31321911", "Electronic connectors and misc. electronic components": "31334419", "Direct life insurance carriers": "55524113", "Fruits and vegetables": "41424480", "Carpet and upholstery cleaning services": "60561740", "Services to buildings and dwellings": "60561700", "Computer systems design services": "60541512", "Credit card issuing": "55522210", "Coin-operated laundries and drycleaners": "80812310", "Residential property managers": "55531311", "Interior design services": "60541410", "Motor vehicle gasoline engine and parts": "31336310", "Pulp, paper, and paperboard mills": "32322100", "Construction machinery": "31333120", "Offices of chiropractors": "65621310", "Grocery and related products": "41424400", "Computer and office machine repair": "80811212", "Roofing contractors": "20238160", "Apparel": "32315000", "Fruit and vegetable canning and drying": "32311420", "Grain and oilseed milling": "32311200", "Commercial printing, except screen": "32323117", "Motor vehicles and parts": "41423100", "Other stone mining and quarrying": "10212319", "Automotive repair and maintenance": "80811100", "Voluntary health organizations": "80813212", "Mortgage and nonmortgage loan brokers": "55522310", "Bowling centers": "70713950", "Poultry processing": "32311615", "Automotive glass replacement shops": "80811122", "Women\'s and children\'s clothing": "41424330", "Building material and garden supply stores": "42444000", "Hardware stores": "42444130", "Office supplies and stationery stores": "42453210", "Beverages": "32329100", "General rental centers": "55532300", "Museums": "70712110", "Painting and wall covering contractors": "20238320", "Transit and ground passenger transportation": "43485000", "Consumer goods rental": "55532200", "Oil and gas pipeline construction": "20237120", "Other services": "80000000", "Machinery": "31333000", "Transportation and warehousing": "43000000", "Optical goods stores": "42446130", "Colleges and universities": "65611300", "Forging and stamping": "31332100", "Metalworking machinery": "31333500", "Logging": "10113300", "Engineering and drafting services": "60541340", "School and employee bus transportation": "43485400", "Electric goods": "41423600", "Outpatient care centers": "65621400", "Finish carpentry contractors": "20238350", "Amusements, gambling, and recreation": "70713000", "Wood products": "31321000", "Food and beverage stores": "42445000", "Other cement and concrete products": "31327390", "Communications equipment": "31334200", "Bituminous coal and lignite surface mining": "10212111", "Sporting and athletic goods": "31339920", "Civic and social organizations": "80813400", "Recyclable materials": "41423930", "Ornamental and architectural metal products": "31332320", "Nonresidential building foundation and exterior contractors": "20238102", "Other information services": "50519000", "Other general purpose machinery": "31333900", "Foam products": "32326150", "Federal hospitals": "90916220", "Telemarketing bureaus": "60561422", "All other fabricated metal products": "31332990", "Musical instrument and supplies stores": "42451140", "Nonstore retailers": "42454000", "Oil and gas extraction": "10211000", "Industrial launderers": "80812332", "Fossil fuel electric power generation": "44221112", "Used merchandise stores": "42453300", "All other general purpose machinery": "31333990", "Credit intermediation and related activities": "55522000", "Dairy products": "32311500", "Newspaper, book, and directory publishers": "50511100", "Lime, gypsum, and other nonmetallic mineral products": "31327900", "Credit bureaus": "60561450", "Stationery and other converted paper products": "32322290", "Electromedical apparatus": "31334510", "Textile mills": "32313000", "Building equipment contractors": "20238200", "Department stores": "42452200", "Bread and bakery products": "32311810", "Natural gas distribution": "44221200", "Other motor vehicle dealers": "42441200", "Newspaper publishers": "50511110", "Hotels and motels, except casino hotels": "70721110", "Motor vehicle and parts dealers": "42441000", "Ambulance services": "65621910", "Women\'s clothing stores": "42448120", "Nonresidential building": "20236200", "Continuing care retirement communities": "65623311", "Private service-providing": "08000000", "Bolts, nuts, screws, rivets, and washers": "31332722", "Sports teams and clubs": "70711211", "Bed-and-breakfast inns": "70721191", "Drycleaning and laundry services": "80812300", "Other residential care facilities": "65623900", "Nursery stock and florists\' supplies": "41424930", "Motor vehicles": "41423110", "Nuclear and other electric power generation": "44221118", "General freight trucking, long-distance": "43484120", "All other ambulatory health care services": "65621990", "Power and communication system construction": "20237130", "Other specialized trucking, local": "43484220", "Miscellaneous electronic instruments": "31334519", "Household and institutional furniture": "31337100", "Direct mail advertising": "60541860", "State government education": "90921611", "Motorcycle, boat, and other vehicle dealers": "42441220", "Automotive parts and accessories stores": "42441310", "Service-providing": "07000000", "Architectural and engineering services": "60541300", "Car washes": "80811192", "Linen and uniform supply": "80812330", "Sugar and confectionery products": "32311300", "Wholesale trade": "41420000", "Miscellaneous durable goods": "41423900", "State government, excluding education": "90922000", "Residential specialty trade contractors": "20238001", "Glass and glazing contractors": "20238150", "Water, sewage and other systems": "44221300", "Cut stock, resawing lumber, planing, and other millwork, including flooring": "31321918", "Miscellaneous store retailers": "42453000", "Poured concrete structure contractors": "20238110", "Computer systems design and related services": "60541500", "Textile product mills": "32314000", "Other computer-related services": "60541519", "Gambling industries": "70713200", "Offices of dentists": "65621200", "Tire dealers": "42441320", "General freight trucking, local": "43484110", "Miscellaneous food products": "32311990", "Data processing, hosting and related services": "50518000", "Financial transaction processing and clearing": "55522320", "Computer facilities management services": "60541513", "Marketing consulting services": "60541613", "Janitorial services": "60561720", "Wood kitchen cabinets and countertops": "31337110", "Snack and nonalcoholic beverage bars": "70722515", "Ship building and repairing": "31336611", "Lawn and garden equipment and supplies stores": "42444200", "Residential building equipment contractors": "20238201", "Cut and sew apparel, except contractors": "32315280", "Convention and trade show organizers": "60561920", "Business service centers": "60561430", "Nondurable goods": "41424000", "Auto parts, accessories, and tire stores": "42441300", "Petroleum and coal products": "32324000", "Outpatient care centers, except mental health": "65621490", "Insurance carriers and related activities": "55524000", "Graphic design services": "60541430", "Wine and spirits": "41424820", "Paperboard containers": "32322210", "Miscellaneous professional and commercial equipment": "41423490", "Nonferrous metal foundries": "31331520", "Document preparation services": "60561410", "Specialized freight trucking": "43484200", "Travel agencies": "60561510", "Convenience stores": "42445120", "Home health equipment rental": "55532283", "Automotive body and interior repair": "80811121", "Outdoor power equipment stores": "42444210", "Household goods repair and maintenance": "80811400", "All other financial investment activities, including funds and trusts": "55523990", "Securities brokerage": "55523120", "Other food products": "32311900", "Guided missiles, space vehicles, and parts": "31336419", "Specialized design services": "60541400", "Metal valves": "31332910", "Mining and oil and gas field machinery": "31333130", "New car dealers": "42441110", "Converted paper products": "32322200", "Special tools, dies, jigs, and fixtures": "31333514", "All other personal services, including photofinishing": "80812990", "State government general administration": "90922920", "Support activities for air transportation": "43488100", "All other amusement and recreation industries": "70713990", "Telephone call centers": "60561420", "Coal mining": "10212100", "Outpatient mental health centers": "65621420", "Metal ore mining": "10212200", "Wireless telecommunications carriers, except satellite": "50517312", "Miscellaneous nondepository credit intermediation": "55522298", "Meat markets and fish and seafood markets": "42445220", "Crushed and broken limestone mining": "10212312", "General freight trucking, long-distance LTL": "43484122", "Software publishers": "50511200", "Automotive equipment rental and leasing": "55532100", "Electronics stores": "42443142", "Local hospitals": "90932622", "Telecommunications": "50517000", "Pulp mills and paper mills": "32322120", "General freight trucking": "43484100", "Search, detection, and navigation instruments": "31334511", "Exterminating and pest control services": "60561710", "Cement and concrete products": "31327300", "Consumer lending": "55522291", "Sporting goods": "41423910", "Research and development in nanotechnology": "60541713", "Lumber and construction supplies": "41423300", "Other residential trade contractors": "20238901", "Furniture and home furnishings stores": "42442000", "Other automotive mechanical and elec. repair": "80811118", "Electroplating, anodizing, and coloring metals": "31332813", "Drywall and insulation contractors": "20238310", "Environment, conservation, and other social advocacy organizations": "80813319", "Other fabricated metal products": "31332900", "Business to business electronic markets": "41425110", "Miscellaneous metalworking machinery": "31333519", "Retail bakeries": "32311811", "Casino hotels": "70721120", "Motor vehicle metal stamping": "31336370", "Local government, excluding education": "90932000", "Goods-producing": "06000000", "Automobiles": "31336111", "Metal windows and doors": "31332321", "Printing and writing paper and office supplies": "41424120", "Other personal services": "80812900", "Medical and diagnostic laboratories": "65621500", "Farm and garden equipment": "41423820", "Rental and leasing services": "55532000", "Fruit and vegetable preserving and specialty": "32311400", "Sports and recreation instruction": "65611620", "Hobby, toy, and game stores": "42451120", "All other traveler accommodation and rooming and boarding houses": "70721199", "Direct title insurance and other direct insurance carriers": "55524128", "Total nonfarm": "00000000", "Transportation equipment": "31336000", "Repair and maintenance": "80811000", "Other telecommunications": "50517900", "Petroleum refineries": "32324110", "Other miscellaneous durable goods manufacturing": "31339900", "Hospitals": "65622000", "Machine tool manufacturing": "31333517", "Other accounting services": "60541219", "Foundries": "31331500", "Electric power and specialty transformers": "31335311", "Pet and pet supplies stores": "42453910", "Warehouse clubs and supercenters": "42452311", "Cut and sew apparel contractors": "32315210", "Soaps, cleaning compounds, and toiletries": "32325600", "Misc. nondurable goods": "41424900", "Research and development in biotechnology, except nanobiotechnology": "60541714", "Miscellaneous nondurable goods manufacturing": "32329000", "Plastics packaging materials, film, and sheet": "32326110", "Other aircraft parts and equipment": "31336413", "Wiring devices": "31335930", "Local government": "90930000", "Jewelry, luggage, and leather goods stores": "42448300", "Electric power transmission and distribution": "44221120", "Office furniture and fixtures": "31337200", "Other Federal government": "90919999", "Social assistance": "65624000", "Nonupholstered wood household furniture": "31337122", "Gasoline stations with convenience stores": "42447110", "Depository credit intermediation": "55522100", "Industrial machinery": "41423830", "Textile furnishings mills": "32314100", "HVAC and commercial refrigeration equipment": "31333400", "Heavy machinery rental and leasing": "55532410", "Grains and field beans": "41424510", "Business and secretarial schools and computer training": "65611420", "Basic chemicals": "32325100", "Special food services": "70722300", "Local government transportation": "90932480", "Motor vehicle electric equipment": "31336320", "Steel products from purchased steel": "31331200", "Building finishing contractors": "20238300", "Professional organizations": "80813920", "New housing operative builders": "20236117", "AC, refrigeration, and forced air heating": "31333415", "Barber shops and beauty salons": "80812112", "Animal, except poultry, slaughtering": "32311611", "State government": "90920000", "Architectural services": "60541310", "Offices of mental health practitioners": "65621330", "Individual and family services": "65624100", "Men\'s clothing stores": "42448110", "Metal heat treating and coating and nonprecious engraving": "31332812", "All other nondurable goods wholesalers": "41424990", "Employment placement agencies": "60561311", "Process and logistics consulting services": "60541614", "Insurance agencies, brokerages, and related services": "55524200", "Vending machine operators": "42454200", "Book publishers": "50511130", "Electric appliances and other electronic parts": "41423690", "Motor vehicle steering and suspension parts": "31336330", "Electric bulk power transmission and control": "44221121", "Activities related to credit intermediation": "55522300", "Professional and similar organizations": "80813900", "Fabricated metal products": "31332000", "Other nonmetallic mineral mining": "10212390", "Directory, mailing list, and other publishers": "50511190", "Books and periodicals": "41424920", "Breakfast cereal": "32311230", "Custom computer programming services": "60541511", "Sawmills and wood preservation": "31321100", "Arts, entertainment, and recreation": "70710000", "Pipeline transportation": "43486000", "Support activities for mining": "10213000", "Cemeteries and crematories": "80812220", "RV parks and recreational camps": "70721200", "Residential mental health facilities": "65623200", "Display advertising": "60541850", "Construction of buildings": "20236000", "Metals and minerals": "41423500", "Textile bag and canvas mills": "32314910", "Medical equipment and supplies": "31339100", "Offices of real estate agents and brokers": "55531200", "Recreational and vacation camps": "70721214", "Facilities support services": "60561200", "Masonry materials": "41423320", "Casinos, except casino hotels": "70713210", "Other textile product mills": "32314900", "Administrative and support services": "60561000", "Elementary and secondary schools": "65611100", "Research and development in the physical, engineering, and life sciences": "60541710", "Printed circuit assemblies": "31334418", "Airport operations": "43488110", "Executive search services": "60561312", "Membership associations and organizations": "80813000", "Plywood and engineered wood products": "31321200", "All other specialty trade contractors": "20238990", "RV parks and campgrounds": "70721211", "Fuel dealers": "42454310", "Trade, transportation, and utilities": "40000000", "Miscellaneous computer and electronic products": "31334600", "Utilities": "44220000", "Supermarkets and other grocery stores": "42445110", "Plumbing and HVAC contractors": "20238220", "Advertising material distribution and other advertising services": "60541890", "Coating, engraving, and heat treating metals": "31332800", "Veterinary services": "60541940", "Other nonferrous metal production": "31331400", "Recreational vehicle dealers": "42441210", "Home furnishings stores": "42442200", "Boilers, tanks, and shipping containers": "31332400", "Building material and supplies dealers": "42444100", "Temporary help services": "60561320", "Electronic equipment repair and maintenance": "80811200", "Publishing industries, except Internet": "50511000", "Education and health services": "65000000", "Other schools and instruction": "65611600", "Animal slaughtering and processing": "32311600", "Limited-service restaurants": "70722513", "Urban, interurban, rural, and charter bus transportation": "43485500", "Local government utilities": "90932221", "Nonresidential property managers": "55531312", "Electricity and signal testing instruments": "31334515", "Sporting goods stores": "42451110", "Beer, wine, and liquor stores": "42445300", "Marketing research and public opinion polling": "60541910", "Miscellaneous durable goods manufacturing": "31339000", "Government": "90000000", "Frozen specialty food": "32311412", "Motion picture and video exhibition": "50512130", "Aircraft engines and engine parts": "31336412", "Other hospitals": "65622300", "Nonresidential building finishing contractors": "20238302", "Household appliances": "31335200", "Used household and office goods moving": "43484210", "Wood containers and pallets": "31321920", "Industrial molds": "31333511", "Offices of physicians, except mental health": "65621111", "Other support services": "60561900", "Medical laboratories": "65621511", "Specialty food stores": "42445200", "Performing arts and spectator sports": "70711000", "Construction equipment": "41423810", "Lessors of nonfinancial intangible assets": "55533000", "Primary metals": "31331000", "U.S. Postal Service": "90919120", "Plastics pipe, fittings, and profile shapes": "32326120", "Photographic services": "60541920", "Death care services": "80812200", "Material handling equipment": "31333920", "Roofing, siding, and other construction materials": "41423390", "Construction": "20000000", "Other building finishing contractors": "20238390", "Building foundation and exterior contractors": "20238100", "Sand, gravel, clay, and refractory mining": "10212320", "Automotive body, interior, and glass repair": "80811120", "Total private": "05000000", "Durable goods": "41423000", "Couriers and messengers": "43492000", "Cookies, crackers, pasta, and tortillas": "32311830", "Ready-mix concrete": "31327320", "Farm supplies": "41424910", "Service establishment equipment": "41423850", "Other chemical products and preparations": "32325900", "Educational support services": "65611700", "Other legal services": "60541190", "Other home furnishings stores": "42442290", "Support activities for water transportation, except marine cargo": "43488390", "Lessors of other real estate property": "55531190", "Accommodation": "70721000", "Mining, except oil and gas": "10212000", "Other State government": "90922999", "Public relations agencies": "60541820", "Petrochemicals, industrial gases, synthetic dyes, and pigments": "32325130", "Clothing and clothing accessories stores": "42448000", "Plumbing equipment": "41423720", "Professional employer organizations": "60561330", "Wired telecommunications carriers": "50517311", "Other grantmaking and giving services": "80813219", "Toilet preparations": "32325620", "Other financial investment activities, including funds and trusts": "55523900", "Floor covering stores": "42442210", "Showcases, partitions, shelving, and lockers": "31337215", "Fabric mills": "32313200", "Siding contractors": "20238170", "Fabricated structural metal products": "31332312", "Securities and commodity contracts brokerage and exchanges": "55523200", "Offices of bank holding companies and of other holding companies": "60551112", "Furniture and related products": "31337000", "Offices of podiatrists": "65621391", "Third-party administration of insurance funds": "55524292", "Personal and laundry services": "80812000", "Shoe stores": "42448200", "Other management consulting services": "60541618", "Management of companies and enterprises": "60550000", "Other direct selling establishments": "42454390", "Television broadcasting": "50515120", "Monetary authorities - central bank": "55521000", "Ferrous metal foundries": "31331510", "All other miscellaneous durable goods manufacturing": "31339990", "State hospitals": "90922622", "Lessors of residential buildings": "55531110", "Motor vehicle bodies and trailers": "31336200", "Paint and wallpaper stores": "42444120", "Agricultural implements": "31333110", "Small arms, ammunition, and other ordnance and accessories": "31332994", "Scientific research and development services": "60541700", "Amusement parks and arcades": "70713100", "Freight transportation arrangement": "43488500", "Toy, hobby, and other durable goods": "41423990", "Real estate and rental and leasing": "55530000", "Full-service restaurants": "70722511", "General warehousing and storage": "43493110", "Offices of optometrists": "65621320", "Media buying agencies and media representatives": "60541840", "Home centers": "42444110", "Truck trailers, motor homes, travel trailers, and campers": "31336214", "Wired and wireless telecommunications carriers": "50517300", "Cafeterias, grill buffets, and buffets": "70722514", "Highway, street, and bridge construction": "20237300", "Jewelry": "41423940", "Machinery and supplies": "41423800", "Support activities for road transportation": "43488400", "Freestanding emergency medical centers": "65621493", "Local government general administration": "90932920", "Other local government": "90932999", "Health care": "65620001", "Sporting goods and musical instrument stores": "42451100", "Passenger car rental and leasing": "55532110", "Hardware": "41423710", "Machine shops and threaded products": "31332700", "Research and development in the physical, engineering, and life sciences, except nanotechnology and biotechnology": "60541715", "Pharmaceuticals and medicines": "32325400", "Resin, rubber, and artificial fibers": "32325200", "Commercial building": "20236220", "Activities related to real estate": "55531300", "Other nondepository credit intermediation": "55522290", "Packaging and labeling services": "60561910", "All other health and personal care stores": "42446199", "Offices of lawyers": "60541110", "Lessors of nonresidential buildings": "55531120", "Broadcasting, except Internet": "50515000", "Tour operators": "60561520", "Leisure and hospitality": "70000000", "Farm product raw materials": "41424500", "Emergency and other relief services": "65624200", "Broadcast and wireless communications equipment": "31334220", "Building inspection, surveying, and mapping services": "60541370", "Nursing and residential care facilities": "65623000", "Computer and software": "41423430", "Flat glass and other pressed and blown glass and glassware": "31327212", "Commercial bakeries and frozen cakes and other pastry products": "32311813", "Nonresidential specialty trade contractors": "20238002", "Computer and peripheral equipment": "31334100", "Management consulting services": "60541610", "Furniture stores": "42442100", "Finance and insurance": "55520000", "Soft drinks and ice": "32329110", "Electrical equipment and wiring": "41423610", "All other rubber products": "32326290", "Other individual and family services": "65624190", "Landscaping services": "60561730", "Community food services": "65624210", "Industrial supplies": "41423840", "General merchandise stores, including warehouse clubs and supercenters": "42452300", "Office furniture and custom architectural woodwork and millwork": "31337214", "Administrative and waste services": "60560000", "Miscellaneous medicinal and biological products": "32325414", "Household appliance stores": "42443141", "Truck transportation": "43484000", "Investment advice": "55523930", "Child day care services": "65624400", "Clay products and refractories": "31327100", "General merchandise stores": "42452000", "All other electrical equipment and components": "31335990", "Local government education": "90931611", "Human resource consulting services": "60541612", "Plate work and fabricated structural products": "31332310", "Support activities for water transportation": "43488300", "Other basic organic chemicals": "32325190", "Management and technical consulting services": "60541600", "Cable and other subscription programming": "50515200", "Auto oil change shops and all other auto repair and maintenance": "80811198", "Landscape architectural services": "60541320", "Automotive mechanical and electrical repair": "80811110", "Lumber and wood": "41423310", "Direct health and medical insurance carriers": "55524114", "Snack food": "32311910", "Social science and humanities research": "60541720", "Gasoline stations": "42447000", "Other personal care services": "80812190", "Local messengers and delivery and private postal service": "43492200", "Other miscellaneous store retailers": "42453900", "Upholstered household furniture": "31337121", "Other traveler accommodation": "70721190", "Other electrical equipment and components": "31335900", "Arts and sports promoters and agents and managers for public figures": "70711300", "Animal food": "32311100", "Nonresidential building equipment contractors": "20238202", "Marine cargo handling": "43488320", "Managing offices": "60551114", "Sewing, needlework, and piece goods stores": "42451130", "Pharmaceutical preparations": "32325412", "Book stores and news dealers": "42451200", "Lessors of real estate": "55531100", "Bituminous coal underground mining and anthracite mining": "10212113", "Water and sewer system construction": "20237110", "Human rights organizations": "80813311", "Retail trade": "42000000", "Spectator sports": "70711200", "Boat building": "31336612", "Residential mental health and substance abuse facilities": "65623220", "Construction sand and gravel mining": "10212321", "Other business support services": "60561490", "Caterers and mobile food services": "70722330", "All other apparel manufacturing": "32315900", "All other motor vehicle parts": "31336390", "Miscellaneous professional and similar organizations": "80813990", "Other gambling industries": "70713290", "Pharmacies and drug stores": "42446110", "Traveler accommodation": "70721100", "Plastics material and resin": "32325211", "Motion picture and video production": "50512110", "Steel and precast concrete contractors": "20238120", "Stone mining and quarrying": "10212310", "Miscellaneous household and institutional furniture": "31337127", "Community housing, emergency, and relief services": "65624230", "Other automotive repair and maintenance": "80811190", "Business support services": "60561400", "Investigation and security services": "60561600", "Children\'s and infants\' clothing stores": "42448130", "industry_name": "industry_code", "Pumps and compressors": "31333910", "Other gasoline stations": "42447190", "Surgical and medical instruments": "31339112", "Reinsurance carriers": "55524130", "Agricultural, construction, and mining machinery": "31333100", "Health care and social assistance": "65620000", "Museums, historical sites, and similar institutions": "70712000", "Apparel and piece goods": "41424300", "Fine arts schools": "65611610", "Ambulatory health care services": "65621000", "Remediation services": "60562910", "Breweries, wineries, and distilleries": "32329140", "New motor vehicle parts": "41423120", "Industrial building": "20236210", "Linen supply": "80812331", "Railroad rolling stock and other transportation equipment": "31336900", "Cutlery and hand tools": "31332200", "Residential intellectual and developmental disability facilities": "65623210", "Office supplies, stationery, and gift stores": "42453200", "Commercial banking": "55522110", "Truck, trailer, and RV rental and leasing": "55532120", "Other spectator sports": "70711219", "Federal": "90910000", "Security systems services": "60561620", "Precision turned products": "31332721", "Hazardous waste treatment and disposal": "60562211", "Electric power distribution": "44221122", "Alcoholic beverages": "41424800", "Electrical contractors": "20238210", "Alumina and aluminum production": "31331300", "Scheduled air transportation": "43481100", "Frozen fruits and vegetables": "32311411", "Historical sites and other similar institutions": "70712190", "Nonpackaging plastics film and sheet": "32326113", "Child and youth services": "65624110", "Nonhazardous waste treatment and disposal": "60562219", "Professional and business services": "60000000", "Clothing accessories stores": "42448150", "Offices of specialty therapists": "65621340", "Other transportation goods": "41423860", "Paper bags and coated and treated paper": "32322220", "Claims adjusting": "55524291", "Other building material dealers": "42444190", "Sheet metal work": "31332322", "Commercial equipment": "41423400", "Mining": "10210000", "Other basic inorganic chemicals": "32325180", "Electronic markets and agents and brokers": "41425000", "Psychiatric and substance abuse hospitals": "65622200", "Golf courses and country clubs": "70713910", "General freight trucking, long-distance TL": "43484121", "Other ambulatory health care services": "65621900", "Plastics bottles and laminated plastics plate, sheet, and shapes": "32326160", "Semiconductors and related devices": "31334413", "Aircraft": "31336411", "Other professional and technical services": "60541900", "Commercial and service industry machinery": "31333300", "Paperboard mills": "32322130", "Jewelry and silverware": "31339910", "Beer and ale": "41424810", "Information": "50000000", "Nonscheduled air transportation": "43481200", "Warehousing and storage": "43493000", "Flour milling, malt, starch, and vegetable oil": "32311220", "General medical and surgical hospitals": "65622100", "Batteries": "31335910", "Air transportation": "43481000", "Other furniture-related products": "31337900", "All other general merchandise stores": "42452319", "Advertising agencies": "60541810", "All other support services": "60561990", "Wholesale trade agents and brokers": "41425120", "Motor vehicle power train components": "31336350", "Remediation and other waste services": "60562900", "Administrative management consulting services": "60541611", "Architectural and structural metals": "31332300", "Offices of certified public accountants": "60541211", "Employment placement agencies and executive search services": "60561310", "Scenic and sightseeing transportation": "43487000", "Used car dealers": "42441120", "Folding boxes and miscellaneous paperboard containers": "32322219", "Musical groups and artists": "70711130", "Miscellaneous warehousing and storage": "43493190", "Direct property and casualty insurers": "55524126", "Other amusement and recreation industries": "70713900", "Drycleaning and laundry services, except coin-operated": "80812320", "Performing arts companies": "70711100", "Printing and related support activities": "32323000", "Services for the elderly and persons with disabilities": "65624120", "Direct selling establishments": "42454300", "Fruit and vegetable markets": "42445230", "Funeral homes and funeral services": "80812210", "Office equipment and other machinery rental and leasing": "55532490", "Aerospace products and parts": "31336400", "Kidney dialysis centers": "65621492", "All other miscellaneous store retailers": "42453990", "Seafood product preparation and packaging": "32311700", "Plastics and rubber products": "32326000", "Restaurants and other eating places": "70722500", "Other plastics products": "32326190", "Blood and organ banks": "65621991", "Cosmetic and beauty supply stores": "42446120", "Land subdivision": "20237200", "Miscellaneous intermediation": "55523910", "Electronic instruments": "31334500", "Support activities for other transportation, including rail": "43488900", "Electrical equipment and appliances": "31335000", "Other wood products": "31321900", "All other textile product mills": "32314990", "Other household and institutional furniture": "31337120", "Iron and steel mills and ferroalloy production": "31331100", "Payroll services": "60541214", "Corrugated and solid fiber boxes": "32322211", "Prefabricated metal buildings, components, and plate work": "31332313", "Diagnostic imaging centers": "65621512", "Food (health) supplement stores": "42446191", "Support activities for transportation": "43488000", "Taxi service": "43485310", "Accounting and bookkeeping services": "60541200", "Electric power generation": "44221110", "Miniwarehouse and self-storage unit operators": "55531130", "Food manufacturing": "32311000", "Other clothing stores": "42448190", "Other nonresidential trade contractors": "20238902", "Druggists\' goods": "41424200", "Glass containers and products made of purchased glass": "31327215", "Fitness and recreational sports centers": "70713940", "Credit unions and other depository credit intermediation": "55522190", "Electronics and appliance stores": "42443000", "Site preparation contractors": "20238910", "Glass and glass products": "31327200", "Frozen food": "32311410", "Security guards and patrols and armored car services": "60561613", "Office administrative services": "60561100", "Home furnishings": "41423220", "Community care facilities for the elderly": "65623300", "Tires": "32326210", "Ornamental and architectural metal work": "31332323", "Other services to buildings and dwellings": "60561790", "All other insurance-related activities": "55524298", "Radio and television broadcasting": "50515100", "HMO medical centers": "65621491", "Theater, dance, and other performing arts companies": "70711190", "Social advocacy organizations": "80813300", "Computer and electronic products": "31334000", "Food service contractors": "70722310", "Portfolio management": "55523920", "Other travel arrangement services": "60561590", "Offices of all other health practitioners": "65621390", "Internet publishing and broadcasting and web search portals": "50519130", "Bare printed circuit boards": "31334412", "Surgical appliances and supplies": "31339113", "Nursery, garden, and farm supply stores": "42444220", "Other building equipment contractors": "20238290", "Telecommunications resellers": "50517911", "Agricultural chemicals": "32325300", "Masonry contractors": "20238140", "Furniture": "41423210", "Art dealers": "42453920", "Framing contractors": "20238130", "Offices of other health practitioners": "65621300", "Miscellaneous fabricated metal products and ball and roller bearings": "31332999", "Nursing care facilities": "65623100", "Cut and sew apparel": "32315200", "Miscellaneous electronic equipment repair and maintenance": "80811219", "Chocolate and confectionery manufacturing": "32311350", "Petroleum": "41424700", "HVAC and refrigeration equipment": "41423740", "Educational services": "65610000", "Other health and personal care stores": "42446190", "Food services and drinking places": "70722000", "Rubber products": "32326200", "Sales financing": "55522220", "Marinas": "70713930", "Direct life and health insurance carriers": "55524110", "Sporting goods, hobby, book, and music stores": "42451000", "Tile and terrazzo contractors": "20238340", "Manufacturing": "30000000", "Paints, coatings, and adhesives": "32325500", "Savings institutions": "55522120", "Millwork": "31321910", "Other heavy construction": "20237900", "Florists": "42453100", "Other insurance-related activities": "55524290", "General line grocery": "41424410", "Fluid power valves and hose fittings": "31332912", "Chemicals": "41424600", "Offices of mental health physicians": "65621112", "Machine shops": "31332710", "Pet care services, except veterinary": "80812910", "Independent artists, writers, and performers": "70711500", "Parking lots and garages": "80812930", "Soft drinks": "32329111", "Tax preparation services": "60541213", "Hair, nail, and skin care services": "80812110", "Real estate credit": "55522292", "All other wood products": "31321990", "Other specialty trade contractors": "20238900", "Clothing stores": "42448100", "Periodical publishers": "50511120", "Nondepository credit intermediation": "55522200", "Motor vehicle seating and interior trim": "31336360", "New single-family general contractors": "20236115", "Nonmetallic mineral products": "31327000", "All other information services": "50519190", "Offices of miscellaneous health practitioners": "65621399", "Waste management and remediation services": "60562000", "Utility system construction": "20237100", "Flooring contractors": "20238330", "Business associations": "80813910", "Refrigerated warehousing and storage": "43493120", "Fluid milk": "32311511", "Real estate": "55531000", "Business, computer, and management training": "65611400", "Radio broadcasting": "50515110", "Furniture and furnishings": "41423200", "Racetracks": "70711212", "Other building exterior contractors": "20238190", "Soaps and cleaning compounds": "32325610", "Health and personal care stores": "42446000", "Hardware and plumbing": "41423700", "Rail transportation": "43482000", "Signs": "31339950", "Other specialty food stores": "42445290", "Collection agencies": "60561440", "Insurance agencies and brokerages": "55524210", "Offices of physicians": "65621100", "Offices of real estate appraisers": "55531320", "Couriers and express delivery services": "43492100", "Miscellaneous ambulatory health care services": "65621999", "Hardware, spring, and wire products": "31332600", "Turbine and power transmission equipment": "31333600", "Specialty trade contractors": "20238000", "Advertising and related services": "60541800", "Electronic shopping and mail-order houses": "42454100", "Materials recovery facilities and other waste management services": "60562990", "Legal services": "60541100", "Department of Defense": "90919110", "Grantmaking foundations": "80813211", "Environmental consulting services": "60541620", "Meat processed from carcasses, and rendering and meat byproduct processing": "32311613", "Power generation and supply": "44221100", "Motor vehicle bodies": "31336211", "Management training": "65611430", "Other ground passenger transportation": "43485900", "Residential building foundation and exterior contractors": "20238101", "Grocery stores": "42445100", "Financial activities": "55000000", "Miscellaneous professional and technical services": "60541990", "Travel arrangement and reservation services": "60561500", "Miscellaneous schools and instruction": "65611690", "Grantmaking and giving services": "80813200", "Technical and trade schools": "65611500", "Personal care services": "80812100", "Family clothing stores": "42448140", "General automotive repair": "80811111", "Residential remodelers": "20236118", "Employment services": "60561300", "Insurance carriers": "55524100", "Industrial process variable instruments": "31334513", "Other credit intermediation activities": "55522390", "Labor unions and similar labor organizations": "80813930", "Taxi and limousine service": "43485300", "Residential building": "20236100", "Miscellaneous outpatient care centers": "65621498", "Telephone answering services": "60561421", "Office equipment": "41423420", "Machinery and equipment rental and leasing": "55532400", "Accommodation and food services": "70720000", "Support activities for oil and gas operations": "10213112", "Real estate property managers": "55531310", "Mining and logging": "10000000", "Motors and generators, switchgears and switchboard apparatus, and relay and industrial controls": "31335314", "Paper and paper products": "41424100", "Automobile dealers": "42441100", "Ship and boat building": "31336600", "Bakeries and tortilla manufacturing": "32311800", "Motion picture and sound recording industries": "50512000", "Security and armored car services": "60561610", "Plastics products": "32326100", "Asphalt paving and roofing materials and other petroleum and coal products": "32324190", "Nail salons": "80812113", "All other metal valves": "31332919", "Federal, except U.S. Postal Service": "90911000", "Dental laboratories": "31339116", "Nonmetallic mineral mining and quarrying": "10212300", "Industrial paper": "41424130", "Junior colleges": "65611200", "Turned products and screws, nuts, and bolts": "31332720", "Direct insurers, except life and health": "55524120", "Gift, novelty, and souvenir stores": "42453220", "Waste collection": "60562100", "Automotive exhaust system and transmission repair": "80811113", "Water transportation": "43483000", "Drinking places, alcoholic beverages": "70722400", "Medical equipment": "41423450", "Investigation services": "60561611", "Residential building finishing contractors": "20238301", "Limousine service": "43485320", "Electric lighting equipment": "31335100", "New multifamily general contractors": "20236116", "Other specialized trucking, long-distance": "43484230", "Motor vehicle parts": "31336300", "Vocational rehabilitation services": "65624300", "Waste treatment and disposal": "60562200", "Professional and technical services": "60540000", "Heavy and civil engineering construction": "20237000"]

struct SuperSector {
    var code: String
    init(_ str: String){
        code = str
    }
}

let superSectorCodeDic = ["Total nonfarm" : SuperSector("00"),
                          "Total private": SuperSector("05"),
                          "Goods-producing": SuperSector("06"),
                          "Service-providing": SuperSector("07"),
                          "Private service-providing": SuperSector("08"),
                          "Mining and logging": SuperSector("10"),
                          "Construction": SuperSector("20"),
                          "Manufacturing": SuperSector("30"),
                          "Durable Goods": SuperSector("31"),
                          "Nondurable Goods": SuperSector("32"),
                          "Trade, transportation, and utilities": SuperSector("40"),
                          "Wholesale trade": SuperSector("41"),
                          "Retail trade": SuperSector("42"),
                          "Transportation and warehousing": SuperSector("43"),
                          "Utilities": SuperSector("44"),
                          "Information": SuperSector("50"),
                          "Financial activities": SuperSector("55"),
                          "Professional and business services": SuperSector("60"),
                          "Education and health services": SuperSector("65"),
                          "Leisure and hospitality": SuperSector("70"),
                          "Other services": SuperSector("80"),
                          "Government": SuperSector("90")    ]

public func getSizeCode(emps: Int?) -> [String] {
    var codes = [String]()
    guard let e = emps else {
        codes.append("0")   //All establishment sizes
        return codes
    }
    switch e {
    case 0..<5: //Fewer than 5 employees per establishment
        codes.append("1")
    case 5..<10: //:    5 to 9 employees per establishment
        codes.append("2")
    case 10..<20:
        codes.append("3")
    case 20..<50:
        codes.append("4")
    case 50..<100:
        codes.append("5")
    case 100..<250:
        codes.append("6")
    case 250..<500:
        codes.append("7")
    case 500..<1000:
        codes.append("8")
    case let a where a >= 1000:
        codes.append("9")
    default:
        codes.append("0")
    }
    return codes
}

enum Region: String {
    case total = "00"
    case midwest = "MW"
    case northeast = "NE"
    case south = "SO"
    case west = "WE"
    
    static var allCases: [Region]{
        return [.total]
    }
}

enum Ownership: String {
    case Total = "0"
    case Federal = "1"
    case State = "2"
    case Local = "3"
    case International = "4"
    case Private = "5"
    
    static var allCases: [Ownership]{
        return [.Total]
    }
}

enum Level: String {
    case all = "00"
    case l1 = "01"
    case l2 = "02"
    case l3 = "03"
    case l4 = "04"
    case l5 = "05"
    case l6 = "06"
    case l7 = "07"
    case l8 = "08"
    case l9 = "09"
    case l10 = "10"
    case l11 = "11"
    case l12 = "12"
    case l13 = "13"
    case l14 = "14"
    case l15 = "15"
    case na = "99"
    
    static var allCases: [Level]{
        return [.all]
    }
}

enum JobTraits: String {
    case all = "00"
    case union = "23"
    case nonunion = "24"
    case fulltime = "25"
    case parttime = "26"
    case timebased = "27"
    case incentive = "28"
    case bargaining = "AD"
    case workStatus = "AE"
    case timeincent = "AF"
    
    static var allCases: [JobTraits]{
        return [.all]
    }
}

enum RateLev: String, CaseIterable {
    case rate = "R"
    case level = "L"
    
    static var allCases: [RateLev]{
        return [.rate, .level]
    }
}

enum Requirement: String, CaseIterable {
    case environment = "E"
    case physical = "P"
    case vocational = "V"
    
    static var allCases: [Requirement]{
        return [.environment, .physical, .vocational]
    }
}

enum AreaType: String, CaseIterable {
    case metnon = "M"  //Metropolitan or nonmetropolitan area
    case national = "N"
    case state = "S"
    
    static var allCases: [AreaType]{
        return [.metnon, .national, .state]
    }
}

enum TurnoverElem: String, CaseIterable {
    case hires = "HI"
    case openings = "JO"
    case laydis = "LD"  //Layoffs and discharges
    case miscseps = "OS"
    case quits = "QU"
    case totseps = "TS"
    
    static var allCases: [TurnoverElem]{
        return [.totseps]
    }
}

enum LausMeasure: String, CaseIterable {
    case unemprate = "03"
    case unemp = "04"
    case emp = "05"
    case laborforce = "06"
    case empPopRat = "07"
    case partrate = "08"
    case civpop = "09"
    
    static var allCases: [LausMeasure]{
        return [.unemprate, .unemp,.emp,.laborforce,.empPopRat,.partrate,.civpop]
    }
}

enum TimeSeries: Hashable {
    
    case NationalEmploymentHoursEarnings(adj: AdjCode, sups: SuperSector, ind: String, dt: String)
    case NationalEmploymentHoursEarningsSic(adj: AdjCode, ind: String, dt: String)
    case StateAreaEmploymentHoursEarnings(adj: AdjCode, st: String, ar: String, sups: SuperSector, ind: String, dt: String)
    case StateAreaEmploymentHoursEarningsSic(adj: AdjCode, st: String, ar: String, ind: String, dt: String)
    case StateCountyEmploymentWagesQuarterlyCensus(adj: AdjCode, ar: String, dt: String, sz: String, own: Ownership, ind: String)
    case StateCountyEmploymentWagesQuarterlyCensusSic(adj: AdjCode, ar: String, dt: String, sz: String, own: Ownership, ind: String)
    case OccupationalEmploymentStatistics(adj: AdjCode, art: AreaType, ar: String, ind: String, occ: String, dt: String)
    case LocalAreaUnemploymentStatistics(adj: AdjCode, ar: String, ms: LausMeasure)
    case JobOpeningsLaborTurnoverSurveySic(adj: AdjCode, ind6: String, reg: Region, del: TurnoverElem, rlv: RateLev)
    case JobOpeningsLaborTurnoverSurvey(adj: AdjCode, ind6: String, reg: Region, del: TurnoverElem, rlv: RateLev)
    case NationalCompensationSurvey(adj: AdjCode, st: String, ar: String, occ: String, lv: Level)
    case ModeledWageEstimates(adj: AdjCode, ar: String, occ: String, jobc: JobTraits, lv: Level)

    var prefix: String {
        get{
            switch self {
            case .NationalEmploymentHoursEarnings: return "CE"
            case .NationalEmploymentHoursEarningsSic: return "EE"
            case .StateAreaEmploymentHoursEarnings: return "SM"
            case .StateAreaEmploymentHoursEarningsSic: return "SA"
            case .StateCountyEmploymentWagesQuarterlyCensus: return "EN"
            case .StateCountyEmploymentWagesQuarterlyCensusSic: return "EW"
            case .OccupationalEmploymentStatistics: return "OE"
            case .LocalAreaUnemploymentStatistics: return "LA"
            case .JobOpeningsLaborTurnoverSurveySic: return "JL"
            case .JobOpeningsLaborTurnoverSurvey: return "JT"
            case .NationalCompensationSurvey: return "NC"
            case .ModeledWageEstimates: return "WM"
            }
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.prefix)
    }
    static func == (lhs: TimeSeries, rhs: TimeSeries) -> Bool {
        return lhs.prefix == rhs.prefix
    }
    
    var code: String {
        var code = ""
        switch self {
        case .NationalEmploymentHoursEarnings(adj: let ad, sups: let ss, ind: let i, dt: let d):
            code = prefix + ad.rawValue + ss.code + i + d
        case .NationalEmploymentHoursEarningsSic(adj: let ad, ind: let i, dt: let d):
            code = prefix + ad.rawValue + i + d
        case .StateAreaEmploymentHoursEarnings(adj: let ad, st: let s, ar: let a, sups: let ss, ind: let i, dt: let d):
            code = prefix + ad.rawValue + s + a + ss.code + i + d
        case .StateAreaEmploymentHoursEarningsSic(adj: let ad, st: let s, ar: let a, ind: let i, dt: let d):
            code = prefix + ad.rawValue + s + a + i + d
        case .StateCountyEmploymentWagesQuarterlyCensus(adj: let ad, ar: let a, dt: let d, sz: let s, own: let o, ind: let i):
            code = prefix + ad.rawValue + a + d + s + o.rawValue + i
        case .StateCountyEmploymentWagesQuarterlyCensusSic(adj: let ad, ar: let a, dt: let d, sz: let s, own: let o, ind: let i):
            code = prefix + ad.rawValue + a + d + s + o.rawValue + i
        case .OccupationalEmploymentStatistics(adj: let ad, art: let at, ar: let a, ind: let i, occ: let o, dt: let d):
            var str = prefix + ad.rawValue + at.rawValue
            str += a + i + o + d
            code = str
        case .LocalAreaUnemploymentStatistics(adj: let ad, ar: let a, ms: let m):
            code = prefix + ad.rawValue + a + m.rawValue
        case .JobOpeningsLaborTurnoverSurveySic(adj: let ad, ind6: let i, reg: let r, del: let de, rlv: let rl):
            var str = prefix + ad.rawValue + i
            str += r.rawValue + de.rawValue + rl.rawValue
            code = str
        case .JobOpeningsLaborTurnoverSurvey(adj: let ad, ind6: let i, reg: let r, del: let de, rlv: let rl):
            var str = prefix + ad.rawValue + i
            str += r.rawValue + de.rawValue + rl.rawValue
            code = str
        case .NationalCompensationSurvey(adj: let ad, st: let s, ar: let a, occ: let o, lv: let l):
            code = prefix + ad.rawValue + s + a + o + l.rawValue
        case .ModeledWageEstimates(adj: let ad, ar: let a, occ: let oc, jobc: let jc, lv: let l):
            code = prefix + ad.rawValue + a + "1" + "02" + "000000" + oc + jc.rawValue + l.rawValue
        }
        print(code)
        return code
    }
    
    var industry: String {
        switch self {
        case .NationalEmploymentHoursEarnings(adj: let ad, sups: let ss, ind: let i, dt: let d):
            return i
        case .NationalEmploymentHoursEarningsSic(adj: let ad, ind: let i, dt: let d):
            return i
        case .JobOpeningsLaborTurnoverSurveySic(adj: let ad, ind6: let i, reg: let r, del: let de, rlv: let rl):
            return i
        case .JobOpeningsLaborTurnoverSurvey(adj: let ad, ind6: let i, reg: let r, del: let de, rlv: let rl):
            return i
        default:
            return ""
        }
    }
}

enum SeriesArray {
    
    case NationalEmploymentHoursEarnings(adjs: [AdjCode], supss: [SuperSector], inds: [String], dts: [String])
    case NationalEmploymentHoursEarningsSic(adjs: [AdjCode], inds: [String], dts: [String])
    case StateAreaEmploymentHoursEarnings(adjs: [AdjCode], sts: [String], ars: [String], supss: [SuperSector], inds: [String], dts: [String])
    case StateAreaEmploymentHoursEarningsSic(adjs: [AdjCode], sts: [String], ars: [String], inds: [String], dts: [String])
    case StateCountyEmploymentWagesQuarterlyCensus(adjs: [AdjCode], ars: [String], dts: [String], szs: [String], owns: [Ownership], inds: [String])
    case StateCountyEmploymentWagesQuarterlyCensusSic(adjs: [AdjCode], ars: [String], dts: [String], szs: [String], owns: [Ownership], inds: [String])
    case OccupationalEmploymentStatistics(adjs: [AdjCode], arts: [AreaType], ars: [String], inds: [String], occs: [String], dts: [String])
    case LocalAreaUnemploymentStatistics(adjs: [AdjCode], ars: [String], mss: [LausMeasure])
    case JobOpeningsLaborTurnoverSurveySic(adjs: [AdjCode], ind6s: [String], regs: [Region], dels: [TurnoverElem], rlvs: [RateLev])
    case JobOpeningsLaborTurnoverSurvey(adjs: [AdjCode], ind6s: [String], regs: [Region], dels: [TurnoverElem], rlvs: [RateLev])
    case NationalCompensationSurvey(adjs: [AdjCode], sts: [String], ars: [String], occs: [String], lvs: [Level])
    case ModeledWageEstimates(adjs: [AdjCode], ars: [String], occs: [String], jobcs: [JobTraits], lvs: [Level])

    var array: [TimeSeries] {
        get{
            var array = [TimeSeries]()
            switch self {
            case .NationalEmploymentHoursEarnings(adjs: let adj, supss: let sups, inds: let ind, dts: let dt):
                for ad in adj {
                    for sup in sups {
                        for id in ind {
                            for t in dt {
                                array.append(TimeSeries.NationalEmploymentHoursEarnings(adj: ad, sups: sup, ind: id, dt: t))
                            }
                        }
                    }
                }
            case .NationalEmploymentHoursEarningsSic(adjs: let adj, inds: let ind, dts: let dt):
                for ad in adj {
                    for id in ind {
                        for t in dt {
                            array.append(TimeSeries.NationalEmploymentHoursEarningsSic(adj: ad, ind: id, dt: t))
                        }
                    }
                }
            case .StateAreaEmploymentHoursEarnings(adjs: let adj, sts: let st, ars: let ar, supss: let sups, inds: let ind, dts: let dt):
                for ad in adj {
                    for s in st {
                        for a in ar {
                            for sup in sups {
                                for id in ind {
                                    for t in dt {
                                        array.append(TimeSeries.StateAreaEmploymentHoursEarnings(adj: ad, st: s, ar: a, sups: sup, ind: id, dt: t))
                                    }
                                }
                            }
                        }
                    }
                }
            case .StateAreaEmploymentHoursEarningsSic(adjs: let adj, sts: let st, ars: let ar, inds: let ind, dts: let dt):
                for ad in adj {
                    for s in st {
                        for a in ar {
                            for id in ind {
                                for t in dt {
                                    array.append(TimeSeries.StateAreaEmploymentHoursEarningsSic(adj: ad, st: s, ar: a, ind: id, dt: t))
                                }
                            }
                        }
                    }
                }
            case .StateCountyEmploymentWagesQuarterlyCensus(adjs: let adj, ars: let ar, dts: let dt, szs: let sz, owns: let own, inds: let ind):
                for ad in adj {
                    for a in ar {
                        for t in dt {
                            for s in sz {
                                for o in own {
                                    for i in ind {
                                        array.append(TimeSeries.StateCountyEmploymentWagesQuarterlyCensus(adj: ad, ar: a, dt: t, sz: s, own: o, ind: i))
                                    }
                                }
                            }
                        }
                    }
                }
            case .StateCountyEmploymentWagesQuarterlyCensusSic(adjs: let adj, ars: let ar, dts: let dt, szs: let sz, owns: let own, inds: let ind):
                for ad in adj {
                    for a in ar {
                        for t in dt {
                            for s in sz {
                                for o in own {
                                    for i in ind {
                                        array.append(TimeSeries.StateCountyEmploymentWagesQuarterlyCensus(adj: ad, ar: a, dt: t, sz: s, own: o, ind: i))
                                    }
                                }
                            }
                        }
                    }
                }
            case .OccupationalEmploymentStatistics(adjs: let adj, arts: let art, ars: let ar, inds: let ind, occs: let occ, dts: let dt):
                for ad in adj {
                    for at in art {
                        for r in ar {
                            for i in ind {
                                for o in occ {
                                    for t in dt {
                                        array.append(TimeSeries.OccupationalEmploymentStatistics(adj: ad, art: at, ar: r, ind: i, occ: o, dt: t))
                                    }
                                }
                            }
                        }
                    }
                }
            case .LocalAreaUnemploymentStatistics(adjs: let adj, ars: let ar, mss: let ms):
                for a in adj {
                    for r in ar {
                        for m in ms {
                            array.append(TimeSeries.LocalAreaUnemploymentStatistics(adj: a, ar: r, ms: m))
                        }
                    }
                }
            case .JobOpeningsLaborTurnoverSurveySic(adjs: let adj, ind6s: let ind, regs: let reg, dels: let del, rlvs: let rlv):
                for a in adj {
                    for i in ind {
                        for r in reg {
                            for d in del {
                                for l in rlv {
                                    array.append(TimeSeries.JobOpeningsLaborTurnoverSurveySic(adj: a, ind6: i, reg: r, del: d, rlv: l))
                                }
                            }
                        }
                    }
                }
            case .JobOpeningsLaborTurnoverSurvey(adjs: let adj, ind6s: let ind, regs: let reg, dels: let del, rlvs: let rlv):
                for a in adj {
                    for i in ind {
                        for r in reg {
                            for d in del {
                                for l in rlv {
                                    array.append(TimeSeries.JobOpeningsLaborTurnoverSurvey(adj: a, ind6: i, reg: r, del: d, rlv: l))
                                }
                            }
                        }
                    }
                }
            case .NationalCompensationSurvey(adjs: let adj, sts: let st, ars: let ar, occs: let occ, lvs: let lv):
                for ad in adj {
                    for s in st {
                        for a in ar {
                            for o in occ {
                                for l in lv {
                                    array.append(TimeSeries.NationalCompensationSurvey(adj: ad, st: s, ar: a, occ: o, lv: l))
                                }
                            }
                        }
                    }
                }
            case .ModeledWageEstimates(adjs: let adj, ars: let ar, occs: let occ, jobcs: let job, lvs: let lv):
                for ad in adj {
                    for a in ar {
                        for o in occ {
                            for j in job {
                                for l in lv {
                                    array.append(TimeSeries.ModeledWageEstimates(adj: ad, ar: a, occ: o, jobc: j, lv: l))
                                }
                            }
                        }
                    }
                }
            }
            return array
        }
    }
}

struct BLSSeriesBatch {
    var batch = [TimeSeries]()
    weak var request: BLSRequest?
    var codes: [String] {
        get{
            var cs = [String]()
            for series in batch {
                cs.append(series.code)
                //print(series.code)
            }
            return cs
        }
    }
    subscript(index: Int) -> TimeSeries {
        get{
            return batch[index]
        }
        set(value){
            batch[index] = value
            updateCodes()
        }
    }
    mutating func append(series: TimeSeries){
        batch.append(series)
        updateCodes()
    }
    mutating func append(seriesArray: [TimeSeries]){
        for ts in seriesArray {
            append(series: ts)
        }
    }
    private func updateCodes(){
        request?.series = codes
    }
    
    
}

struct ResData: Codable {
    var year: String
    var period: String
    var periodName: String
    var latest: String
    var value: String
    var footnotes: [Footnote]?
    private enum CodingKeys: String, CodingKey {
        case year
        case period
        case periodName
        case latest
        case value
        case footnotes
    }
    init(from decoder: Decoder) throws {
        print("\t\t\tDecode: Data")
        let container = try decoder.container(keyedBy: CodingKeys.self)
        print("\t\t\t\tyear")
        year = try container.decode(String.self, forKey: .year)
        print("\t\t\t\tperiod")
        period = try container.decode(String.self, forKey: .period)
        print("\t\t\t\tperiodName")
        periodName = try container.decode(String.self, forKey: .periodName)
        print("\t\t\t\tlatest")
        latest = try container.decodeIfPresent(String.self, forKey: .latest) ?? "false"
        print("\t\t\t\tvalue")
        value = try container.decode(String.self, forKey: .value)
        print("\t\t\t\tyear")
        footnotes = try? container.decodeIfPresent([Footnote].self, forKey: .footnotes) ?? nil
        print("\t\t\tDecoded: Data")
    }
    struct Footnote: Codable {
        var code: String?
        var text: String?
        init(from decoder: Decoder) throws {
            print("\t\t\t\tDecode: Footnote")
            let container = try decoder.container(keyedBy: CodingKeys.self)
            code = try? container.decodeIfPresent(String.self, forKey: .code) ?? nil
            text = try? container.decodeIfPresent(String.self, forKey: .text) ?? nil
            print("\t\t\t\tDecoded: Footnote")
        }
        private enum CodingKeys: String, CodingKey {
            case code
            case text
        }
    }
}

struct Series: Codable {
    var seriesID: String
    var data: [ResData]?
    private enum CodingKeys: String, CodingKey {
        case seriesID
        case data
    }
    init(from decoder: Decoder) throws {
        print("\t\tDecode: Series")
        let container = try decoder.container(keyedBy: CodingKeys.self)
        print("\t\t\tseriesID")
        seriesID = try container.decode(String.self, forKey: .seriesID)
        print("\t\t\tdata")
        data = try container.decodeIfPresent([ResData].self, forKey: .data) ?? [ResData]()
        print("\t\tDecoded: Series")
    }
}

struct RequestResult: Codable {
    var series: [Series]
    private enum CodingKeys: String, CodingKey {
        case series
    }
    init(from decoder: Decoder) throws {
        print("\tDecode: Result")
        let container = try decoder.container(keyedBy: CodingKeys.self)
        print("\t\tDecode: series")
        series = try container.decodeIfPresent([Series].self, forKey: .series) ?? [Series]()
        print("\tDecoded: Result")
    }
}

struct RequestResponse: Codable {
    var status: String
    var responseTime: Int
    var message: [String]?
    var results: RequestResult
    private enum CodingKeys: String, CodingKey {
        case status
        case responseTime
        case message
        case results = "Results"
    }
    init(from decoder: Decoder) throws {
        print("Decode: Response")
        let container = try decoder.container(keyedBy: CodingKeys.self)
        print("\tstatus")
        status = try container.decode(String.self, forKey: .status)
        print("\tresponseTime")
        responseTime = try container.decode(Int.self, forKey: .responseTime)
        print("\tmessage")
        message = try container.decodeIfPresent([String].self, forKey: .message)
        print("\tresults")
        results = try container.decode(RequestResult.self, forKey: .results)
        print("Decoded: Response")
    }
}

class BLSRequest: CustomRequest {
    //http://danstrong.tech/blog/BLS-API/
    //tutorial on using BLS API
    var response : RequestResponse?
    var body = Dictionary<String, Any>()
    var batch : BLSSeriesBatch {
        didSet{
            batch.request = self
            //print(batch.codes)
            series = batch.codes
        }
    }    // = BLSSeriesBatch()
    var series: [String]? {
        get{
            guard let list = body["seriesid"] as? [String], list.count > 0 else {
                return nil
            }
            return list
        }
        set(val){
            body["seriesid"] = val
        }
    }
    var startyear: String? {
        get{ return body["startyear"] as? String }
    }
    var endyear: String? {
        get{ return body["endyear"] as? String }
    }
    var catalog: Bool? {
        get{ return body["catalog"] as? Bool }
    }
    var calculations: Bool? {
       get{ return body["calculations"] as? Bool }
    }
    var annualaverage: Bool? {
       get{ return body["annualaverage"] as? Bool }
    }
    
    init(method: String, path: String){
        batch = BLSSeriesBatch()
        super.init(api_host: BLS_URL, path: path, method: method)
        batch.request = self
        header(key: "Content-Type", val: "application/json")
        body.updateValue(BLS_KEY, forKey: "registrationKey")
    }
    
    /*override func handlerFunc(_ data: Data, _ response: URLResponse?, _ error: Error?) {
        print(String(decoding: data, as: UTF8.self))
        do {
            //print(data.description)
            let response = try JSONDecoder().decode(RequestResponse.self, from: data)
            self.response = response
            print(response)
        }
        catch  {
            print("error trying to convert data to JSON")
            return
        }
    }*/
    
    override func queryString() -> String {
        super.queryString()
    }
    
    override func bodyData() -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: body, options: []) else {
            return nil
        }
        return data
    }
}
