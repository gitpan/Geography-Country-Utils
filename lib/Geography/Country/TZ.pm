package Geography::Country::TZ;
use Geography::Country::TZ::Zone;

require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw(areas areas_dmy from_iso);

BEGIN {
        eval { require Net::Country;
               %country = %Net::Country::country;
               @country{keys %country} = map {s/\s*\(.*\)\s*$//; lc($_);} values %country;
               %cross = reverse %country;
        };
}

while (<DATA>) {
        chop;
        ($cn, $geo, $tz) = split(/\s+/);
        $hash{$cn} ||= [];
        push(@{$hash{$cn}}, $tz);
}

sub from_iso {
        $cross{lc($_[0])};
}

sub areas {
        my $cn = uc(shift);
        my $areas = $hash{$cn} || $hash{from_iso($cn)};
        return undef unless ($areas);
        my @areas = @$areas;
        sort {$a <=> $b} map {Geography::Country::TZ::Zone::getoffset($_);}
                @areas;
}

sub areas_dmy {
        my $cn = uc(shift);
        my $areas = $hash{$cn} || $hash{$cross{$cn}};
        return undef unless ($areas);
        my @areas = @$areas;
        sort {$a <=> $b} map {Geography::Country::TZ::Zone::getpastoffset($_, @_);}
                @areas;
}

1;

__DATA__
AD	+4230+00131	Europe/Andorra
AE	+2518+05518	Asia/Dubai
AF	+3431+06912	Asia/Kabul
AG	+1703-06148	America/Antigua
AI	+1812-06304	America/Anguilla
AL	+4120+01950	Europe/Tirane
AM	+4011+04430	Asia/Yerevan
AN	+1211-06900	America/Curacao
AO	-0848+01314	Africa/Luanda
AQ	-7750+16636	Antarctica/McMurdo	McMurdo Station, Ross Island
AQ	-9000+00000	Antarctica/South_Pole	Amundsen-Scott Station, South Pole
AQ	-6448-06406	Antarctica/Palmer	Palmer Station, Anvers Island
AQ	-6736+06253	Antarctica/Mawson	Mawson Station, Holme Bay
AQ	-6835+07758	Antarctica/Davis	Davis Station, Vestfold Hills
AQ	-6617+11031	Antarctica/Casey	Casey Station, Bailey Peninsula
AQ	-6640+14001	Antarctica/DumontDUrville	Dumont-d'Urville Base, Terre Adelie
AQ	-690022+0393524	Antarctica/Syowa	Syowa Station, E Ongul I
AR	-3436-05827	America/Buenos_Aires	E Argentina (BA, DF, SC, TF)
AR	-3257-06040	America/Rosario	NE Argentina (SF, ER, CN, MN, CC, FM, LP, CH)
AR	-3124-06411	America/Cordoba	W Argentina (CB, SA, TM, LR, SJ, SL, NQ, RN)
AR	-2411-06518	America/Jujuy	Jujuy (JY)
AR	-2828-06547	America/Catamarca	Catamarca (CT)
AR	-3253-06849	America/Mendoza	Mendoza (MZ)
AS	-1416-17042	Pacific/Pago_Pago
AT	+4813+01620	Europe/Vienna
AU	-3133+15905	Australia/Lord_Howe	Lord Howe Island
AU	-4253+14719	Australia/Hobart	Tasmania
AU	-3749+14458	Australia/Melbourne	Victoria
AU	-3352+15113	Australia/Sydney	New South Wales - most locations
AU	-3157+14127	Australia/Broken_Hill	New South Wales - Broken Hill
AU	-2728+15302	Australia/Brisbane	Queensland - most locations
AU	-2016+14900	Australia/Lindeman	Queensland - Holiday Islands
AU	-3455+13835	Australia/Adelaide	South Australia
AU	-1228+13050	Australia/Darwin	Northern Territory
AU	-3157+11551	Australia/Perth	Western Australia
AW	+1230-06858	America/Aruba
AZ	+4023+04951	Asia/Baku
BA	+4352+01825	Europe/Sarajevo
BB	+1306-05937	America/Barbados
BD	+2343+09025	Asia/Dhaka
BE	+5050+00420	Europe/Brussels
BF	+1222-00131	Africa/Ouagadougou
BG	+4241+02319	Europe/Sofia
BH	+2623+05035	Asia/Bahrain
BI	-0323+02922	Africa/Bujumbura
BJ	+0629+00237	Africa/Porto-Novo
BM	+3217-06446	Atlantic/Bermuda
BN	+0456+11455	Asia/Brunei
BO	-1630-06809	America/La_Paz
BR	-0351-03225	America/Noronha	Atlantic islands
BR	-0127-04829	America/Belem	Amapa, E Para
BR	-0343-03830	America/Fortaleza	NE Brazil (MA, PI, CE, RN, PR)
BR	-0803-03454	America/Recife	Pernambuco
BR	-0712-04812	America/Araguaina	Tocantins
BR	-0940-03543	America/Maceio	Alagoas, Sergipe
BR	-2332-04637	America/Sao_Paulo	S & SE Brazil (BA, GO, DF, MG, ES, RJ, SP, PR, SC, RS)
BR	-1535-05605	America/Cuiaba	Mato Grosso, Mato Grosso do Sul
BR	-0846-06354	America/Porto_Velho	W Para, Rondonia
BR	+0249-06040	America/Boa_Vista	Roraima
BR	-0308-06001	America/Manaus	E Amazonas
BR	-0640-06952	America/Eirunepe	W Amazonas
BR	-0934-06731	America/Porto_Acre	Acre
BS	+2505-07721	America/Nassau
BT	+2728+08939	Asia/Thimphu
BW	-2545+02555	Africa/Gaborone
BY	+5354+02734	Europe/Minsk
BZ	+1730-08812	America/Belize
CA	+4734-05243	America/St_Johns	Newfoundland Island
CA	+4439-06336	America/Halifax	Atlantic Time - Nova Scotia (most places), NB, W Labrador, E Quebec & PEI
CA	+4612-05957	America/Glace_Bay	Atlantic Time - Nova Scotia - places that did not observe DST 1966-1971
CA	+5320-06025	America/Goose_Bay	Atlantic Time - E Labrador
CA	+4531-07334	America/Montreal	Eastern Time - Ontario & Quebec - most locations
CA	+4901-08816	America/Nipigon	Eastern Time - Ontario & Quebec - places that did not observe DST 1967-1973
CA	+4823-08915	America/Thunder_Bay	Eastern Time - Thunder Bay, Ontario
CA	+6608-06544	America/Pangnirtung	Eastern Standard Time - Pangnirtung, Nunavut
CA	+6344-06828	America/Iqaluit	Eastern Standard Time - east Nunavut
CA	+6245-09210	America/Rankin_Inlet	Eastern Standard Time - central Nunavut
CA	+4953-09709	America/Winnipeg	Central Time - Manitoba & west Ontario
CA	+4843-09429	America/Rainy_River	Central Time - Rainy River & Fort Frances, Ontario
CA	+6903-10505	America/Cambridge_Bay	Central Time - west Nunavut
CA	+5024-10439	America/Regina	Central Standard Time - Saskatchewan - most locations
CA	+5017-10750	America/Swift_Current	Central Standard Time - Saskatchewan - midwest
CA	+5333-11328	America/Edmonton	Mountain Time - Alberta, east British Columbia & west Saskatchewan
CA	+6227-11421	America/Yellowknife	Mountain Time - central Northwest Territories
CA	+6825-11330	America/Inuvik	Mountain Time - west Northwest Territories
CA	+5946-12014	America/Dawson_Creek	Mountain Standard Time - Dawson Creek & Fort Saint John, British Columbia
CA	+4916-12307	America/Vancouver	Pacific Time - west British Columbia
CA	+6043-13503	America/Whitehorse	Pacific Time - south Yukon
CA	+6404-13925	America/Dawson	Pacific Time - north Yukon
CC	-1210+09655	Indian/Cocos
CD	-0418+01518	Africa/Kinshasa	west Dem. Rep. of Congo
CD	-1140+02728	Africa/Lubumbashi	east Dem. Rep. of Congo
CF	+0422+01835	Africa/Bangui
CG	-0416+01517	Africa/Brazzaville
CH	+4723+00832	Europe/Zurich
CI	+0519-00402	Africa/Abidjan
CK	-2114-15946	Pacific/Rarotonga
CL	-3327-07040	America/Santiago	mainland
CL	-2710-10927	Pacific/Easter	Easter Island
CM	+0403+00942	Africa/Douala
CN	+4545+12641	Asia/Harbin	north Manchuria
CN	+3114+12128	Asia/Shanghai	China coast
CN	+2934+10635	Asia/Chungking	China mountains
CN	+4348+08735	Asia/Urumqi	Tibet & Xinjiang
CN	+3929+07559	Asia/Kashgar	Eastern Turkestan
CO	+0436-07405	America/Bogota
CR	+0956-08405	America/Costa_Rica
CU	+2308-08222	America/Havana
CV	+1455-02331	Atlantic/Cape_Verde
CX	-1025+10543	Indian/Christmas
CY	+3510+03322	Asia/Nicosia
CZ	+5005+01426	Europe/Prague
DE	+5230+01322	Europe/Berlin
DJ	+1136+04309	Africa/Djibouti
DK	+5540+01235	Europe/Copenhagen
DM	+1518-06124	America/Dominica
DO	+1828-06954	America/Santo_Domingo
DZ	+3647+00303	Africa/Algiers
EC	-0210-07950	America/Guayaquil	mainland
EC	-0054-08936	Pacific/Galapagos	Galapagos Islands
EE	+5925+02445	Europe/Tallinn
EG	+3003+03115	Africa/Cairo
EH	+2709-01312	Africa/El_Aaiun
ER	+1520+03853	Africa/Asmera
ES	+4024-00341	Europe/Madrid	mainland
ES	+3553-00519	Africa/Ceuta	Ceuta & Melilla
ES	+2806-01524	Atlantic/Canary	Canary Islands
ET	+0902+03842	Africa/Addis_Ababa
FI	+6010+02458	Europe/Helsinki
FJ	-1808+17825	Pacific/Fiji
FK	-5142-05751	Atlantic/Stanley
FM	+0931+13808	Pacific/Yap	Yap
FM	+0725+15147	Pacific/Truk	Truk (Chuuk)
FM	+0658+15813	Pacific/Ponape	Ponape (Pohnpei)
FM	+0519+16259	Pacific/Kosrae	Kosrae
FO	+6201-00646	Atlantic/Faeroe
FR	+4852+00220	Europe/Paris
GA	+0023+00927	Africa/Libreville
GB	+512830-0001845	Europe/London	Great Britain
GB	+5435-00555	Europe/Belfast	Northern Ireland
GD	+1203-06145	America/Grenada
GE	+4143+04449	Asia/Tbilisi
GF	+0456-05220	America/Cayenne
GH	+0533-00013	Africa/Accra
GI	+3608-00521	Europe/Gibraltar
GL	+7030-02215	America/Scoresbysund	east Greenland
GL	+6411-05144	America/Godthab	southwest Greenland
GL	+7634-06847	America/Thule	northwest Greenland
GM	+1328-01639	Africa/Banjul
GN	+0931-01343	Africa/Conakry
GP	+1614-06132	America/Guadeloupe
GQ	+0345+00847	Africa/Malabo
GR	+3758+02343	Europe/Athens
GS	-5416-03632	Atlantic/South_Georgia
GT	+1438-09031	America/Guatemala
GU	+1328+14445	Pacific/Guam
GW	+1151-01535	Africa/Bissau
GY	+0648-05810	America/Guyana
HK	+2217+11409	Asia/Hong_Kong
HN	+1406-08713	America/Tegucigalpa
HR	+4548+01558	Europe/Zagreb
HT	+1832-07220	America/Port-au-Prince
HU	+4730+01905	Europe/Budapest
ID	-0610+10648	Asia/Jakarta	Java & Sumatra
ID	-0507+11924	Asia/Ujung_Pandang	Borneo & Celebes
ID	-0232+14042	Asia/Jayapura	Irian Jaya & the Moluccas
IE	+5320-00615	Europe/Dublin
IL	+3146+03514	Asia/Jerusalem
IN	+2232+08822	Asia/Calcutta
IO	-0720+07225	Indian/Chagos
IQ	+3321+04425	Asia/Baghdad
IR	+3540+05126	Asia/Tehran
IS	+6409-02151	Atlantic/Reykjavik
IT	+4154+01229	Europe/Rome
JM	+1800-07648	America/Jamaica
JO	+3157+03556	Asia/Amman
JP	+353916+1394441	Asia/Tokyo
KE	-0117+03649	Africa/Nairobi
KG	+4254+07436	Asia/Bishkek
KH	+1133+10455	Asia/Phnom_Penh
KI	+0125+17300	Pacific/Tarawa	Gilbert Islands
KI	-0308-17105	Pacific/Enderbury	Phoenix Islands
KI	+0152-15720	Pacific/Kiritimati	Line Islands
KM	-1141+04316	Indian/Comoro
KN	+1718-06243	America/St_Kitts
KP	+3901+12545	Asia/Pyongyang
KR	+3733+12658	Asia/Seoul
KW	+2920+04759	Asia/Kuwait
KY	+1918-08123	America/Cayman
KZ	+4315+07657	Asia/Almaty	east Kazakhstan
KZ	+5017+05710	Asia/Aqtobe	central Kazakhstan
KZ	+4431+05016	Asia/Aqtau	west Kazakhstan
LA	+1758+10236	Asia/Vientiane
LB	+3353+03530	Asia/Beirut
LC	+1401-06100	America/St_Lucia
LI	+4709+00931	Europe/Vaduz
LK	+0656+07951	Asia/Colombo
LR	+0618-01047	Africa/Monrovia
LS	-2928+02730	Africa/Maseru
LT	+5441+02519	Europe/Vilnius
LU	+4936+00609	Europe/Luxembourg
LV	+5657+02406	Europe/Riga
LY	+3254+01311	Africa/Tripoli
MA	+3339-00735	Africa/Casablanca
MC	+4342+00723	Europe/Monaco
MD	+4700+02850	Europe/Chisinau	most locations
MD	+4651+02938	Europe/Tiraspol	Transdniestria
MG	-1855+04731	Indian/Antananarivo
MH	+0709+17112	Pacific/Majuro	most locations
MH	+0905+16720	Pacific/Kwajalein	Kwajalein
MK	+4159+02126	Europe/Skopje
ML	+1239-00800	Africa/Bamako	southwest Mali
ML	+1446-00301	Africa/Timbuktu	northeast Mali
MM	+1647+09610	Asia/Rangoon
MN	+4755+10653	Asia/Ulaanbaatar	most locations
MN	+4801+09139	Asia/Hovd	Bayan-Olgiy, Hovd, Uvs
MO	+2214+11335	Asia/Macao
MP	+1512+14545	Pacific/Saipan
MQ	+1436-06105	America/Martinique
MR	+1806-01557	Africa/Nouakchott
MS	+1644-06213	America/Montserrat
MT	+3554+01431	Europe/Malta
MU	-2010+05730	Indian/Mauritius
MV	+0410+07330	Indian/Maldives
MW	-1547+03500	Africa/Blantyre
MX	+1924-09909	America/Mexico_City	Central Time - most locations
MX	+2105-08646	America/Cancun	Central Time - Quintana Roo
MX	+2058-08937	America/Merida	Central Time - Campeche, Yucatan
MX	+2540-10019	America/Monterrey	Central Time - Coahuila, Durango, Nuevo Leon, Tamaulipas
MX	+2313-10625	America/Mazatlan	Mountain Time - S Baja, Nayarit, Sinaloa
MX	+2838-10605	America/Chihuahua	Mountain Time - Chihuahua
MX	+2904-11058	America/Hermosillo	Mountain Standard Time - Sonora
MX	+3232-11701	America/Tijuana	Pacific Time
MY	+0310+10142	Asia/Kuala_Lumpur	peninsular Malaysia
MY	+0133+11020	Asia/Kuching	Sabah & Sarawak
MZ	-2558+03235	Africa/Maputo
NA	-2234+01706	Africa/Windhoek
NC	-2216+16530	Pacific/Noumea
NE	+1331+00207	Africa/Niamey
NF	-2903+16758	Pacific/Norfolk
NG	+0627+00324	Africa/Lagos
NI	+1209-08617	America/Managua
NL	+5222+00454	Europe/Amsterdam
NO	+5955+01045	Europe/Oslo
NP	+2743+08519	Asia/Katmandu
NR	-0031+16655	Pacific/Nauru
NU	-1901+16955	Pacific/Niue
NZ	-3652+17446	Pacific/Auckland	most locations
NZ	-4355-17630	Pacific/Chatham	Chatham Islands
OM	+2336+05835	Asia/Muscat
PA	+0858-07932	America/Panama
PE	-1203-07703	America/Lima
PF	-1732-14934	Pacific/Tahiti	Society Islands
PF	-0900-13930	Pacific/Marquesas	Marquesas Islands
PF	-2308-13457	Pacific/Gambier	Gambier Islands
PG	-0930+14710	Pacific/Port_Moresby
PH	+1435+12100	Asia/Manila
PK	+2452+06703	Asia/Karachi
PL	+5215+02100	Europe/Warsaw
PM	+4703-05620	America/Miquelon
PN	-2504-13005	Pacific/Pitcairn
PR	+182806-0660622	America/Puerto_Rico
PS	+3130+03428	Asia/Gaza
PT	+3843-00908	Europe/Lisbon	mainland
PT	+3238-01654	Atlantic/Madeira	Madeira Islands
PT	+3744-02540	Atlantic/Azores	Azores
PW	+0720+13429	Pacific/Palau
PY	-2516-05740	America/Asuncion
QA	+2517+05132	Asia/Qatar
RE	-2052+05528	Indian/Reunion
RO	+4426+02606	Europe/Bucharest
RU	+5443+02030	Europe/Kaliningrad	Moscow-01 - Kaliningrad
RU	+5545+03735	Europe/Moscow	Moscow+00 - west Russia
RU	+5312+05009	Europe/Samara	Moscow+01 - Caspian Sea
RU	+5651+06036	Asia/Yekaterinburg	Moscow+02 - Urals
RU	+5500+07324	Asia/Omsk	Moscow+03 - west Siberia
RU	+5502+08255	Asia/Novosibirsk	Moscow+03 - Novosibirsk
RU	+5601+09250	Asia/Krasnoyarsk	Moscow+04 - Yenisei River
RU	+5216+10420	Asia/Irkutsk	Moscow+05 - Lake Baikal
RU	+6200+12940	Asia/Yakutsk	Moscow+06 - Lena River
RU	+4310+13156	Asia/Vladivostok	Moscow+07 - Amur River
RU	+5934+15048	Asia/Magadan	Moscow+08 - Magadan & Sakhalin
RU	+5301+15839	Asia/Kamchatka	Moscow+09 - Kamchatka
RU	+6445+17729	Asia/Anadyr	Moscow+10 - Bering Sea
RW	-0157+03004	Africa/Kigali
SA	+2438+04643	Asia/Riyadh
SB	-0932+16012	Pacific/Guadalcanal
SC	-0440+05528	Indian/Mahe
SD	+1536+03232	Africa/Khartoum
SE	+5920+01803	Europe/Stockholm
SG	+0117+10351	Asia/Singapore
SH	-1555-00542	Atlantic/St_Helena
SI	+4603+01431	Europe/Ljubljana
SJ	+7800+01600	Arctic/Longyearbyen	Svalbard
SJ	+7059-00805	Atlantic/Jan_Mayen	Jan Mayen
SK	+4809+01707	Europe/Bratislava
SL	+0830-01315	Africa/Freetown
SM	+4355+01228	Europe/San_Marino
SN	+1440-01726	Africa/Dakar
SO	+0204+04522	Africa/Mogadishu
SR	+0550-05510	America/Paramaribo
ST	+0020+00644	Africa/Sao_Tome
SV	+1342-08912	America/El_Salvador
SY	+3330+03618	Asia/Damascus
SZ	-2618+03106	Africa/Mbabane
TC	+2128-07108	America/Grand_Turk
TD	+1207+01503	Africa/Ndjamena
TF	-492110+0701303	Indian/Kerguelen
TG	+0608+00113	Africa/Lome
TH	+1345+10031	Asia/Bangkok
TJ	+3835+06848	Asia/Dushanbe
TK	-0922-17114	Pacific/Fakaofo
TM	+3757+05823	Asia/Ashgabat
TN	+3648+01011	Africa/Tunis
TO	-2110+17510	Pacific/Tongatapu
TP	-0833+12535	Asia/Dili
TR	+4101+02858	Europe/Istanbul
TT	+1039-06131	America/Port_of_Spain
TV	-0831+17913	Pacific/Funafuti
TW	+2503+12130	Asia/Taipei
TZ	-0648+03917	Africa/Dar_es_Salaam
UA	+5026+03031	Europe/Kiev	most locations
UA	+4837+02218	Europe/Uzhgorod	Ruthenia
UA	+4750+03510	Europe/Zaporozhye	Zaporozh'ye, E Lugansk
UA	+4457+03406	Europe/Simferopol	central Crimea
UG	+0019+03225	Africa/Kampala
UM	+1700-16830	Pacific/Johnston	Johnston Atoll
UM	+2813-17722	Pacific/Midway	Midway Islands
UM	+1917+16637	Pacific/Wake	Wake Island
US	+404251-0740023	America/New_York	Eastern Time
US	+421953-0830245	America/Detroit	Eastern Time - Michigan - most locations
US	+381515-0854534	America/Louisville	Eastern Time - Kentucky - Louisville area
US	+364947-0845057	America/Kentucky/Monticello	Eastern Time - Kentucky - Wayne County
US	+394606-0860929	America/Indianapolis	Eastern Standard Time - Indiana - most locations
US	+382232-0862041	America/Indiana/Marengo	Eastern Standard Time - Indiana - Crawford County
US	+411745-0863730	America/Indiana/Knox	Eastern Standard Time - Indiana - Starke County
US	+384452-0850402	America/Indiana/Vevay	Eastern Standard Time - Indiana - Switzerland County
US	+415100-0873900	America/Chicago	Central Time
US	+450628-0873651	America/Menominee	Central Time - Michigan - Wisconsin border
US	+394421-1045903	America/Denver	Mountain Time
US	+433649-1161209	America/Boise	Mountain Time - south Idaho & east Oregon
US	+364708-1084111	America/Shiprock	Mountain Time - Navajo
US	+332654-1120424	America/Phoenix	Mountain Standard Time - Arizona
US	+340308-1181434	America/Los_Angeles	Pacific Time
#US      +611305-1495401 America/Anchorage       Alaska Time
#US      +581807-1342511 America/Juneau  Alaska Time - Alaska panhandle
#US      +593249-1394338 America/Yakutat Alaska Time - Alaska panhandle neck
#US      +643004-1652423 America/Nome    Alaska Time - west Alaska
#US      +515248-1763929 America/Adak    Aleutian Islands
#US      +211825-1575130 Pacific/Honolulu        Hawaii
UY	-3453-05611	America/Montevideo
UZ	+3940+06648	Asia/Samarkand	west Uzbekistan
UZ	+4120+06918	Asia/Tashkent	east Uzbekistan
VA	+4154+01227	Europe/Vatican
VC	+1309-06114	America/St_Vincent
VE	+1030-06656	America/Caracas
VG	+1827-06437	America/Tortola
VI	+1821-06456	America/St_Thomas
VN	+1045+10640	Asia/Saigon
VU	-1740+16825	Pacific/Efate
WF	-1318-17610	Pacific/Wallis
WS	-1350-17144	Pacific/Apia
YE	+1245+04512	Asia/Aden
YT	-1247+04514	Indian/Mayotte
YU	+4450+02030	Europe/Belgrade
ZA	-2615+02800	Africa/Johannesburg
ZM	-1525+02817	Africa/Lusaka
ZW	-1750+03103	Africa/Harare
