<<<<<<< HEAD
//Maya ASCII 2019 scene
//Name: lentil_base_setup.ma
//Last modified: Sun, Nov 15, 2020 04:52:56 PM
//Codeset: 1252
requires maya "2019";
requires -nodeType "aiOptions" -nodeType "aiAOV" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter"
		 -nodeType "aiLentilImager" -nodeType "lentil_operator" "mtoa" "4.1.0";
requires "stereoCamera" "10.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2019";
fileInfo "version" "2019";
fileInfo "cutIdentifier" "201812112215-434d8d9c04";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 18363)\n";
createNode transform -s -n "persp";
	rename -uid "7979F7A5-43D1-557C-D606-22B293D46CA7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.10685052051239019 24.909000722065791 303.45942936830636 ;
	setAttr ".r" -type "double3" -2.7383527296039651 -1.4000000000002282 -6.2138757676485337e-18 ;
=======
//Maya ASCII 2018ff08 scene
//Name: lentil_base_setup_new.ma
//Last modified: Sat, Nov 14, 2020 03:17:22 PM
//Codeset: UTF-8
requires maya "2018ff08";
requires "stereoCamera" "10.0";
requires -nodeType "aiOptions" -nodeType "aiAOV" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter"
		 -nodeType "aiLentilImager" -nodeType "lentil_operator" "mtoa" "4.1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201804211841-f3d65dda2a";
fileInfo "osv" "Mac OS X 10.15.2";
createNode transform -s -n "persp";
	rename -uid "7979F7A5-43D1-557C-D606-22B293D46CA7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.1766004773680301 45.893757150439804 301.72933657907208 ;
	setAttr ".r" -type "double3" -6.3383527296040443 -1.8000000000000034 -2.4860350531207619e-17 ;
>>>>>>> 8190a96cbf5a8737877912818ae126aa119bca5b
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "823F5335-4F55-A022-B660-04A77F21778B";
	setAttr -k off ".v" no;
	setAttr ".ovr" 1.3;
	setAttr ".fl" 40;
	setAttr ".coi" 335.08835473789111;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".dr" yes;
<<<<<<< HEAD
	setAttr ".ai_translator" -type "string" "lentil_camera";
	setAttr ".fstop" 1.3999999761581421;
	setAttr ".focus_distance" 40;
	setAttr ".focal_length" 40;
	setAttr ".optical_vignetting_distance" 4;
=======
	setAttr ".ai_focus_distance" 30;
	setAttr ".ai_aperture_size" 1;
	setAttr ".ai_edof" yes;
	setAttr ".ai_translator" -type "string" "lentil_camera";
	setAttr ".fstop" 1.7999999523162842;
	setAttr ".focus_distance" 30;
	setAttr ".focal_length" 40;
>>>>>>> 8190a96cbf5a8737877912818ae126aa119bca5b
	setAttr ".bidir_sample_mult" 10;
createNode transform -s -n "top";
	rename -uid "9F6F2133-49A8-CA0A-727A-349A21BF4F2A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "2E87CE5A-468A-8908-D646-2EB6FE52A979";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "28D9BFDC-47D5-FFFC-BE7C-8C8A32862B4E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "BF74C62D-4F53-AB9D-296A-1A9DE66F3E43";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "448C710D-4383-66D2-76EE-F9A7D6E74134";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "1090EEB8-466E-DB81-76C4-35923EAAE3B8";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "grp_lights";
	rename -uid "79ACA9D5-4998-4CFF-6140-AD8BA15845A0";
	setAttr ".rp" -type "double3" -1.4517867614910596 28.667046595875302 -94.745276949610599 ;
	setAttr ".sp" -type "double3" -1.4517867614910596 28.667046595875302 -94.745276949610599 ;
createNode transform -n "pointLight9" -p "grp_lights";
	rename -uid "3539BB54-41D0-1B52-BA38-BE97D37685EE";
	setAttr ".t" -type "double3" 4.2259836107268427 -50.250547080669392 1.4210854715202004e-14 ;
createNode pointLight -n "pointLightShape9" -p "pointLight9";
	rename -uid "65D23F0D-4411-4DF5-B4C0-A38864634FB3";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.1971069574356079;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3997.701416015625;
	setAttr ".ai_radius" 0.88455104827880859;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight8" -p "grp_lights";
	rename -uid "49CE4D59-479D-E3BB-61A3-65B902E15A8A";
	setAttr ".t" -type "double3" -6.575111936593629 -29.711818735175225 1.4210854715202004e-14 ;
createNode pointLight -n "pointLightShape8" -p "pointLight8";
	rename -uid "0E252EB6-4C75-FD37-A4FC-1EA0FC8132BD";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.8339616060256958;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 5458.31787109375;
	setAttr ".ai_radius" 0.69635438919067383;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight7" -p "grp_lights";
	rename -uid "DFF66135-4C1E-A2D3-BDD5-15A641C33CA8";
	setAttr ".t" -type "double3" 24.547229790622293 -10.91847367369952 0 ;
createNode pointLight -n "pointLightShape7" -p "pointLight7";
	rename -uid "8DA8B739-485B-2E33-E4AF-AF856D43D71C";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.3242264986038208;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4904.09228515625;
	setAttr ".ai_radius" 0.98219788074493408;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight6" -p "grp_lights";
	rename -uid "5E9F18AF-4EA9-F08C-D81E-798D68887CE1";
	setAttr ".t" -type "double3" 43.761212970843502 -9.5781803709261872 -54.884873804636285 ;
createNode pointLight -n "pointLightShape6" -p "pointLight6";
	rename -uid "274A9CE9-4CE4-978D-9A9E-7CAD8E6D4142";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.7461905479431152;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4530.93115234375;
	setAttr ".ai_radius" 0.85258674621582031;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight52" -p "grp_lights";
	rename -uid "EE87D737-4E7E-DEA4-0D51-5E89202475DC";
	setAttr ".t" -type "double3" 32.763345873992677 23.062638480670465 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape52" -p "pointLight52";
	rename -uid "EA3A03CB-46C2-5F31-9F76-B387A97DED37";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 2.6346728801727295;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4500.87060546875;
	setAttr ".ai_radius" 0.60427761077880859;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight51" -p "grp_lights";
	rename -uid "49802388-4437-3A29-B960-BE9B6E24F733";
	setAttr ".t" -type "double3" 47.902394406314976 17.151055583334859 -126.5533514021308 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape51" -p "pointLight51";
	rename -uid "1BCE938F-4076-5915-3526-DCBD0E6677CB";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 0.80186450481414795;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4307.62109375;
	setAttr ".ai_radius" 0.61771178245544434;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight50" -p "grp_lights";
	rename -uid "FD3F8C18-400E-CB15-3937-388D57173598";
	setAttr ".t" -type "double3" 78.034368485572728 37.494460196924933 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape50" -p "pointLight50";
	rename -uid "466870AD-408E-854A-0142-2F9704617EAB";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.1963952779769897;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4104.33935546875;
	setAttr ".ai_radius" 0.68580543994903564;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight5" -p "grp_lights";
	rename -uid "81805F60-47C6-E86C-8A0B-2B96073AF3C0";
	setAttr ".t" -type "double3" 32.960117423523023 10.960547974567969 -103.0876176398403 ;
createNode pointLight -n "pointLightShape5" -p "pointLight5";
	rename -uid "001066BA-4B9D-ACA4-1324-9F958C4F52C5";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 2.1061549186706543;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 5870.13818359375;
	setAttr ".ai_radius" 0.74212026596069336;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight49" -p "grp_lights";
	rename -uid "70F4685F-4B45-3D4C-D660-32B476C2C929";
	setAttr ".t" -type "double3" 66.208284607837456 57.46060071504013 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape49" -p "pointLight49";
	rename -uid "CA6E1241-4F5A-6A36-A8D6-F4868E5BEB83";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.6165271997451782;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3518.2333984375;
	setAttr ".ai_radius" 0.59243226051330566;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight48" -p "grp_lights";
	rename -uid "CD58A942-45E3-C62F-8C49-AA8C481D30C2";
	setAttr ".t" -type "double3" 65.361397911325511 -20.505315319715795 -126.5533514021308 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape48" -p "pointLight48";
	rename -uid "95C0110A-4D5B-27F4-F8AE-82A4CF445F85";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.9999276399612427;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 5744.33642578125;
	setAttr ".ai_radius" 0.6398921012878418;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight47" -p "grp_lights";
	rename -uid "9163D58C-408A-B7DD-C8CD-C4A2DC5314C9";
	setAttr ".t" -type "double3" 95.493371990583299 -0.16191070612573455 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape47" -p "pointLight47";
	rename -uid "3BAA99BB-472B-789A-5316-EBB4E72D9EBD";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.4509603977203369;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4555.0107421875;
	setAttr ".ai_radius" 0.63133835792541504;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight46" -p "grp_lights";
	rename -uid "296E70C9-48E7-B40B-A20E-229EB05DEB40";
	setAttr ".t" -type "double3" 83.667288112848041 19.804229811989476 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape46" -p "pointLight46";
	rename -uid "9F9032DA-4E03-E9CC-4E97-DFAAA8E24878";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.8163846731185913;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 2344.198486328125;
	setAttr ".ai_radius" 0.65897047519683838;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight45" -p "grp_lights";
	rename -uid "D1D6CC0F-4D90-5C9B-668A-55AF74C46344";
	setAttr ".t" -type "double3" -3.1135505398904701 28.58288980469219 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape45" -p "pointLight45";
	rename -uid "06379F07-4C03-4F6D-6FDA-DB9EA7137859";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.3906334638595581;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3869.5673828125;
	setAttr ".ai_radius" 0.57071948051452637;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight44" -p "grp_lights";
	rename -uid "335C13BF-44BD-341C-D9C7-14B93526838E";
	setAttr ".t" -type "double3" -21.419440741412991 -11.726655327013088 -34.197832067254438 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape44" -p "pointLight44";
	rename -uid "3BF003FA-495A-FD76-E630-D6A5A1737691";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.358642578125;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3098.58740234375;
	setAttr ".ai_radius" 0.57382094860076904;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight43" -p "grp_lights";
	rename -uid "0BDFB4CE-4E89-3711-897D-5B82819F2528";
	setAttr ".t" -type "double3" 8.7125333378447873 8.6167492865769759 -96.365005340437122 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape43" -p "pointLight43";
	rename -uid "FDB5BC7A-404D-3E4D-517A-F484CBB24D86";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 2.248152494430542;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 5080.53125;
	setAttr ".ai_radius" 0.68165099620819092;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight42" -p "grp_lights";
	rename -uid "4EDFA98C-40A3-1E5A-7B56-AD8646E8661F";
	setAttr ".t" -type "double3" -35.477117202609833 15.969305645423582 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape42" -p "pointLight42";
	rename -uid "1A73ED3D-4204-797F-2A57-1285879478A4";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.0570886135101318;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4984.08447265625;
	setAttr ".ai_radius" 0.95572543144226074;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight41" -p "grp_lights";
	rename -uid "A9392055-4800-6B59-5297-C2948D61C1BB";
	setAttr ".t" -type "double3" -65.609091281867606 -4.3740989681664892 -126.5533514021308 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape41" -p "pointLight41";
	rename -uid "610D5A82-4324-3D7B-DD79-8285C1FFC08A";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.5640881061553955;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3201.50244140625;
	setAttr ".ai_radius" 0.52111196517944336;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight40" -p "grp_lights";
	rename -uid "C042780B-47B2-44EA-DBD9-8E9E749542BC";
	setAttr ".t" -type "double3" -47.303201080345076 35.935446163538792 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape40" -p "pointLight40";
	rename -uid "1459C2E4-4B54-075F-92E6-E388CD9F1714";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.1303391456604004;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4378.89306640625;
	setAttr ".ai_radius" 0.59506165981292725;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight4" -p "grp_lights";
	rename -uid "E7E1ADA9-4FF0-733B-8A59-74BA0D306619";
	setAttr ".t" -type "double3" 64.082459150738956 29.753893036043674 0 ;
createNode pointLight -n "pointLightShape4" -p "pointLight4";
	rename -uid "F2C78F77-4892-6E58-EFAB-3CB83E7CB564";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.0985997915267944;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3943.90673828125;
	setAttr ".ai_radius" 0.8359830379486084;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight39" -p "grp_lights";
	rename -uid "6FF01860-4693-2740-6D33-D48B9E226F67";
	setAttr ".t" -type "double3" -28.181599508597724 38.245833386198804 -62.323650300060109 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape39" -p "pointLight39";
	rename -uid "52C36953-421A-B384-2502-7B84D549F3F1";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.991923451423645;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3778.806396484375;
	setAttr ".ai_radius" 0.54895484447479248;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight38" -p "grp_lights";
	rename -uid "454789C8-47B1-55C4-A436-7DAEA7024CC5";
	setAttr ".t" -type "double3" 44.58942975172792 3.0964979625552544 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape38" -p "pointLight38";
	rename -uid "21FFCE62-4BE2-9187-F5F6-B9B55C529DA5";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 2.3203175067901611;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4581.57666015625;
	setAttr ".ai_radius" 0.56211066246032715;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight37" -p "grp_lights";
	rename -uid "8EA784D8-4F13-7A55-5BDD-E5B3EC817333";
	setAttr ".t" -type "double3" -9.8757093070752173 78.555378517904074 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape37" -p "pointLight37";
	rename -uid "2A2D98D0-42AE-E56D-85CB-208DCCE37B77";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 2.1419706344604492;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4872.5087890625;
	setAttr ".ai_radius" 0.5294036865234375;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight36" -p "grp_lights";
	rename -uid "C397F5AB-40BB-EBDC-7E19-30A590E41182";
	setAttr ".t" -type "double3" 14.45745567247018 -17.246906651034809 -126.5533514021308 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape36" -p "pointLight36";
	rename -uid "6DE33689-41D5-D9A1-91F1-1399E5C0882D";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.4178780317306519;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4064.55029296875;
	setAttr ".ai_radius" 0.66918015480041504;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight35" -p "grp_lights";
	rename -uid "B89FFF4D-43D3-01BB-B230-9FB2170776FA";
	setAttr ".t" -type "double3" 1.9503745706600364 58.589237999788864 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape35" -p "pointLight35";
	rename -uid "C869C73A-4E46-C9F9-D780-77B3C76869EE";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 0.84479999542236328;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3169.626953125;
	setAttr ".ai_radius" 0.53128194808959961;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight34" -p "grp_lights";
	rename -uid "0025A334-4556-5AF3-CED4-729E1C7BFA6D";
	setAttr ".t" -type "double3" -96.57452108664036 -13.611419454333305 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape34" -p "pointLight34";
	rename -uid "D95DD56A-4D3D-195E-8BB7-EE8F68F479BE";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.9197033643722534;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4022.40673828125;
	setAttr ".ai_radius" 0.96002578735351562;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight33" -p "grp_lights";
	rename -uid "31B5E507-4A4D-3746-6962-7A81F17E239E";
	setAttr ".t" -type "double3" -57.496662725520238 3.0963123951009166 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape33" -p "pointLight33";
	rename -uid "43EE00B5-4842-AB9F-39B3-889EE5917D25";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.3699609041213989;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4013.1240234375;
	setAttr ".ai_radius" 0.89347469806671143;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight32" -p "grp_lights";
	rename -uid "D5CA1323-48DE-9F7E-ADC1-139549F3FEEA";
	setAttr ".t" -type "double3" -45.670578847784988 -16.869828123014305 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape32" -p "pointLight32";
	rename -uid "436E3D6D-4C9C-5CC6-B020-23809928525F";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.6080601215362549;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 5913.83837890625;
	setAttr ".ai_radius" 0.71255743503570557;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight31" -p "grp_lights";
	rename -uid "E72656DB-4C86-137B-DF69-B78241DE869A";
	setAttr ".t" -type "double3" -75.802552927042768 -37.213232736604354 -126.5533514021308 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape31" -p "pointLight31";
	rename -uid "08086228-4573-A677-EA77-A2BCD22DF4F6";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.4073474407196045;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3147.328369140625;
	setAttr ".ai_radius" 0.70549881458282471;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight30" -p "grp_lights";
	rename -uid "B1928D75-40FB-8B85-60B5-3A811865EAD6";
	setAttr ".t" -type "double3" -74.955666230530838 40.752683298151567 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape30" -p "pointLight30";
	rename -uid "B3628796-4C01-273A-6AD9-CFB9404FEDD4";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.1291053295135498;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 6612.09375;
	setAttr ".ai_radius" 0.95992410182952881;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight3" -p "grp_lights";
	rename -uid "2A320C31-40EB-AA9F-4AB9-65A756437B99";
	setAttr ".t" -type "double3" 20.321246179895475 39.332073406969869 0 ;
createNode pointLight -n "pointLightShape3" -p "pointLight3";
	rename -uid "1621674D-4392-8AFC-9848-29B1A9656D28";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.7319406270980835;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3454.621337890625;
	setAttr ".ai_radius" 0.60273361206054688;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight29" -p "grp_lights";
	rename -uid "C929FC56-4D2D-5954-57BB-3F928091883D";
	setAttr ".t" -type "double3" -63.12958235279558 20.78654278003636 -126.55335140213079 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape29" -p "pointLight29";
	rename -uid "D8A3BE81-4B71-AE1F-97AD-C6AD6298AAB7";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.2923902273178101;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4966.92431640625;
	setAttr ".ai_radius" 0.79893004894256592;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight28" -p "grp_lights";
	rename -uid "ACAC939C-47E6-AB76-9124-C7AC4FF3757A";
	setAttr ".t" -type "double3" -93.261556432053325 0.44313816644629256 -126.5533514021308 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape28" -p "pointLight28";
	rename -uid "9CF9CBA0-49D5-A0B7-8A51-9190C1ACE516";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.3989074230194092;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 2444.51953125;
	setAttr ".ai_radius" 0.62500500679016113;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight27" -p "grp_lights";
	rename -uid "DD5445AA-48D6-1794-5E5F-89BEB0550C99";
	setAttr ".t" -type "double3" -108.40060496437563 6.3547210637819624 -96.442659043722117 ;
	setAttr ".r" -type "double3" 0 0 -177.10084361282443 ;
createNode pointLight -n "pointLightShape27" -p "pointLight27";
	rename -uid "28C9B332-419A-E37E-338B-A19E96CFA0AC";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.9785864353179932;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4230.53759765625;
	setAttr ".ai_radius" 0.81209158897399902;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight26" -p "grp_lights";
	rename -uid "582762D7-4726-0EE3-80DC-88BA4CFA74A1";
	setAttr ".t" -type "double3" 106.2765592783705 16.874485559858631 1.4210854715202004e-14 ;
createNode pointLight -n "pointLightShape26" -p "pointLight26";
	rename -uid "FA5D449F-4BF1-9608-F787-03A96AFCC3CF";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.8821709156036377;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4103.90185546875;
	setAttr ".ai_radius" 0.78335714340209961;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight25" -p "grp_lights";
	rename -uid "BC0EEA58-4E81-80CD-2677-BB90F9E3408E";
	setAttr ".t" -type "double3" 91.455884613655641 23.544208589997126 0 ;
createNode pointLight -n "pointLightShape25" -p "pointLight25";
	rename -uid "3C5BC413-40FF-2EBE-D302-BAACE089FBCF";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.3849259614944458;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3477.36962890625;
	setAttr ".ai_radius" 0.78792417049407959;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight24" -p "grp_lights";
	rename -uid "8C643741-4719-B0AD-D4AE-9DB6E0798B8C";
	setAttr ".t" -type "double3" 60.333542886439737 4.7508635285214176 1.4210854715202004e-14 ;
createNode pointLight -n "pointLightShape24" -p "pointLight24";
	rename -uid "7FA9A406-49AB-B7F8-147B-B5891B8D8B41";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.7975180149078369;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4622.6279296875;
	setAttr ".ai_radius" 0.82559812068939209;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight23" -p "grp_lights";
	rename -uid "41E191DE-4B23-994E-9542-82B5AA32C673";
	setAttr ".t" -type "double3" 71.134638433760202 -15.787864816972746 1.4210854715202004e-14 ;
createNode pointLight -n "pointLightShape23" -p "pointLight23";
	rename -uid "42C5FE63-46E0-89B7-49DA-53AA5024188D";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 2.1041197776794434;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3469.787841796875;
	setAttr ".ai_radius" 0.91499054431915283;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight22" -p "grp_lights";
	rename -uid "F8AB1E99-48C3-5143-FB51-D98267511EDE";
	setAttr ".t" -type "double3" 75.923819633124737 62.035428763130852 0 ;
createNode pointLight -n "pointLightShape22" -p "pointLight22";
	rename -uid "0867F5F5-4E4B-BE36-6C52-329BBA6A10F4";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.3395870923995972;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4982.3994140625;
	setAttr ".ai_radius" 0.61865377426147461;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight21" -p "grp_lights";
	rename -uid "A9BFBD74-4329-4740-B32A-E7ABCE734F44";
	setAttr ".t" -type "double3" 44.801477905908833 43.24208370165514 -54.456882802741859 ;
createNode pointLight -n "pointLightShape21" -p "pointLight21";
	rename -uid "36469879-44A2-231F-3F86-888A44D613A4";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 0.94332283735275269;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 5170.724609375;
	setAttr ".ai_radius" 0.99477577209472656;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight20" -p "grp_lights";
	rename -uid "C08AB7B2-4942-249F-C7F3-B695DEC23024";
	setAttr ".t" -type "double3" 55.602573453229297 22.703355356160976 1.4210854715202004e-14 ;
createNode pointLight -n "pointLightShape20" -p "pointLight20";
	rename -uid "8EA06036-4316-3E96-2ED3-BDAADC0E7427";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 2.506671667098999;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 5337.205078125;
	setAttr ".ai_radius" 0.74003911018371582;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight2" -p "grp_lights";
	rename -uid "9EAAC2E7-4494-4854-D7D3-FCB2D492AC76";
	setAttr ".t" -type "double3" -10.801095547320472 20.538728345494164 1.4210854715202004e-14 ;
createNode pointLight -n "pointLightShape2" -p "pointLight2";
	rename -uid "49E9C4F6-44E6-5970-6135-DA9D71B4C07E";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.2853813171386719;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3589.097900390625;
	setAttr ".ai_radius" 0.83279085159301758;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight19" -p "grp_lights";
	rename -uid "D69AD582-4CA6-7DD7-09E2-65983CF6F7FA";
	setAttr ".t" -type "double3" 95.475463731050027 37.413213905352798 -62.770435395714223 ;
createNode pointLight -n "pointLightShape19" -p "pointLight19";
	rename -uid "374A0785-4B6E-B214-7DDD-598B7593B3C8";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.0372860431671143;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4634.46484375;
	setAttr ".ai_radius" 0.75974667072296143;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight18" -p "grp_lights";
	rename -uid "FF998D80-4707-3027-754E-86BFB8537C5B";
	setAttr ".t" -type "double3" -86.225758901653307 13.156645863367658 1.4210854715202004e-14 ;
createNode pointLight -n "pointLightShape18" -p "pointLight18";
	rename -uid "E1FB4D0E-49B0-60D0-ED6A-0B8A5590AF4A";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 2.7509210109710693;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4097.1943359375;
	setAttr ".ai_radius" 0.64414846897125244;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight17" -p "grp_lights";
	rename -uid "8D87AC42-410C-A099-1BE7-0A81B127E81B";
	setAttr ".t" -type "double3" -97.026854448973793 33.695374208861821 -32.452106271323103 ;
createNode pointLight -n "pointLightShape17" -p "pointLight17";
	rename -uid "E896F4C9-4B54-44B7-07CE-ACBC8F9C7404";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.2741727828979492;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 2458.889404296875;
	setAttr ".ai_radius" 0.73521697521209717;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight16" -p "grp_lights";
	rename -uid "ADC76452-4641-FD37-537A-83B5E853282A";
	setAttr ".t" -type "double3" -65.904512721757868 52.488719270337526 -67.492327744524772 ;
createNode pointLight -n "pointLightShape16" -p "pointLight16";
	rename -uid "E1A87231-4587-736F-9B0C-BBA9D09C45BC";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.6269112825393677;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 2849.1494140625;
	setAttr ".ai_radius" 0.67261815071105957;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight15" -p "grp_lights";
	rename -uid "CA0855F4-4589-276D-C5FA-ECBC87E34432";
	setAttr ".t" -type "double3" -70.693693921122403 -25.334574309766065 1.4210854715202004e-14 ;
createNode pointLight -n "pointLightShape15" -p "pointLight15";
	rename -uid "F3463329-4B1E-3A46-03A2-CEA14FFB43FD";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.0398229360580444;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 5945.873046875;
	setAttr ".ai_radius" 0.86393237113952637;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight14" -p "grp_lights";
	rename -uid "7227B338-4954-7E7B-1024-4C9AD63D6CE9";
	setAttr ".t" -type "double3" -81.49478946844286 -4.7958459642719085 -53.602386979715405 ;
createNode pointLight -n "pointLightShape14" -p "pointLight14";
	rename -uid "AB290C36-44C2-E1B6-C8E6-2DA75213E16C";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.8556419610977173;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 5669.00244140625;
	setAttr ".ai_radius" 0.67423784732818604;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight13" -p "grp_lights";
	rename -uid "60B8DF79-4A01-459D-6427-AB895E7A36CD";
	setAttr ".t" -type "double3" -50.372447741226949 13.997499097203798 0 ;
createNode pointLight -n "pointLightShape13" -p "pointLight13";
	rename -uid "521C5F1A-41C3-CF52-99F0-4FBD444C1C46";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 1.6539455652236938;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 6257.09326171875;
	setAttr ".ai_radius" 0.83998143672943115;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight12" -p "grp_lights";
	rename -uid "1E3F705B-4DF6-EA0D-CB6B-9A9BB8667B25";
	setAttr ".t" -type "double3" -35.551773076512077 7.3277760670653009 -52.288440083696706 ;
createNode pointLight -n "pointLightShape12" -p "pointLight12";
	rename -uid "D2203DF0-4DF6-87AB-1157-8F96A687B979";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.6724963188171387;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4615.47509765625;
	setAttr ".ai_radius" 0.94267594814300537;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight11" -p "grp_lights";
	rename -uid "7C1DFB2C-40B3-AE1A-7C2E-EE96FD8E08EC";
	setAttr ".t" -type "double3" -46.352868623832549 27.866504412559468 -84.193877468557602 ;
createNode pointLight -n "pointLightShape11" -p "pointLight11";
	rename -uid "45F6AD95-4CEB-D8F2-25B6-09A0D23CEB54";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".ai_exposure" 1.9609600305557251;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4080.498046875;
	setAttr ".ai_radius" 0.80108964443206787;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight10" -p "grp_lights";
	rename -uid "00E42330-42B9-1B64-8E17-05B8DB432A92";
	setAttr ".t" -type "double3" -15.230526896616631 46.659849474035177 0 ;
createNode pointLight -n "pointLightShape10" -p "pointLight10";
	rename -uid "3DB9F1B2-45BB-47C5-FA49-A0B567FDE00C";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 0.93714159727096558;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 4647.3759765625;
	setAttr ".ai_radius" 0.85203909873962402;
	setAttr ".ai_camera" 1;
createNode transform -n "pointLight1" -p "grp_lights";
	rename -uid "455C82D2-41D1-179C-4994-6D9B0E3DEC8B";
	setAttr ".t" -type "double3" 2.2204460492503131e-16 -3.5527136788005009e-15 -60.119688665888795 ;
createNode pointLight -n "pointLightShape1" -p "pointLight1";
	rename -uid "E65FD473-48E4-B842-1DE6-EF8198CAF75D";
	setAttr -k off ".v";
	setAttr ".in" 30;
	setAttr ".us" no;
	setAttr ".ai_exposure" 0.90588772296905518;
	setAttr ".ai_use_color_temperature" yes;
	setAttr ".ai_color_temperature" 3741.361572265625;
	setAttr ".ai_radius" 0.66820347309112549;
	setAttr ".ai_camera" 1;
createNode lightLinker -s -n "lightLinker1";
<<<<<<< HEAD
	rename -uid "00F6ACF1-44B8-B201-BD94-5AAEE32CF7A9";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "570DCC3E-4828-4BEA-505C-ED94F44F4AFE";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "37BBF90A-4E11-FDB9-6658-80B5F96363BD";
createNode displayLayerManager -n "layerManager";
	rename -uid "8C86914C-40CB-1696-F1AC-8B977C97AA46";
createNode displayLayer -n "defaultLayer";
	rename -uid "8B7D63FC-498A-FB4F-3BB9-B4A3BDEEAF8E";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "E6308596-41F0-4E21-BC16-6BB807F85F6B";
=======
	rename -uid "CD50CF16-0D48-C942-7A7A-29A285DCC671";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "3C691563-0745-2A61-1009-AF98C7A79A1A";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "EF306003-D740-915B-3093-CCB3CB51D795";
createNode displayLayerManager -n "layerManager";
	rename -uid "162DB52F-8044-6CBA-4807-20845FD8A370";
createNode displayLayer -n "defaultLayer";
	rename -uid "8B7D63FC-498A-FB4F-3BB9-B4A3BDEEAF8E";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "D0DDE30C-6C4D-862A-5A57-29B09034D998";
>>>>>>> 8190a96cbf5a8737877912818ae126aa119bca5b
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "6A5D892B-4486-1F7D-B835-D489702956C8";
	setAttr ".g" yes;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "29C6C9A4-4E44-E8D4-00F0-22B74A8CDF32";
	addAttr -ci true -sn "ARV_options" -ln "ARV_options" -dt "string";
<<<<<<< HEAD
	setAttr -s 3 ".aovs";
	setAttr ".logf" -type "string" "";
	setAttr ".logv" 3;
	setAttr ".version" -type "string" "4.1.0";
	setAttr ".ARV_options" -type "string" "Test Resolution=100%;Camera=perspShape;Color Management.Gamma=1;Color Management.Exposure=0;Background.BG=BG Color;Background.Color=0 0 0;Background.Image=;Background.Scale=1       1;Background.Offset=0       0;Background.Apply Color Management=1;Foreground.Enable FG=0;Foreground.Image=;Foreground.Scale=1       1;Foreground.Offset=0       0;Foreground.Apply Color Management=1;";
=======
	setAttr -s 2 ".aovs";
	setAttr ".logf" -type "string" "";
	setAttr ".logv" 3;
	setAttr ".version" -type "string" "4.1.0";
	setAttr ".ARV_options" -type "string" "Test Resolution=100%;Camera=perspShape;Color Management.Gamma=1;Color Management.Exposure=0;Background.BG=BG Color;Background.Color=0 0 0;Background.Image=;Background.Scale=1         1;Background.Offset=0         0;Background.Apply Color Management=1;Foreground.Enable FG=0;Foreground.Image=;Foreground.Scale=1         1;Foreground.Offset=0         0;Foreground.Apply Color Management=1;";
>>>>>>> 8190a96cbf5a8737877912818ae126aa119bca5b
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "8377149B-43AA-B712-89E1-40AEE522732A";
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "8B89F677-48B7-FA78-0265-58BC0EE56977";
	setAttr ".ai_translator" -type "string" "exr";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "F4103EFE-4DA8-2AB4-08EA-258036521D90";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode script -n "uiConfigurationScriptNode";
	rename -uid "1F01684C-40A3-D4BB-07B3-98A11009BDE6";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
<<<<<<< HEAD
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 599\n            -height 1597\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 1\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 0\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n"
		+ "            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"dagName\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n"
		+ "            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n"
		+ "                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n"
		+ "\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n"
		+ "                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n"
		+ "                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n"
		+ "\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 599\\n    -height 1597\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 599\\n    -height 1597\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
=======
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n"
		+ "            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n"
		+ "            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n"
		+ "            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n"
		+ "            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n"
		+ "            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 396\n            -height 478\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 1\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n"
		+ "            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 0\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n"
		+ "            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"dagName\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n"
		+ "            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n"
		+ "            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n"
		+ "                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n"
		+ "                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n"
		+ "                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n"
		+ "                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n"
		+ "                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n"
		+ "                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n"
		+ "                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n"
		+ "                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n"
		+ "                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 396\\n    -height 478\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 396\\n    -height 478\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
>>>>>>> 8190a96cbf5a8737877912818ae126aa119bca5b
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 10 -size 100 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "F65A2F52-43DC-ADB8-456C-D495054F19DF";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "4B3F6B94-4123-5A5E-B82C-F58D8A2E2691";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -488.6077040334813 -248.0978246393359 ;
	setAttr ".tgi[0].vh" -type "double2" 483.38101878192748 281.87412451534811 ;
	setAttr ".tgi[0].ni[0].x" 54.285713195800781;
	setAttr ".tgi[0].ni[0].y" 42.857143402099609;
	setAttr ".tgi[0].ni[0].nvs" 18304;
createNode aiAOV -n "aiAOV_RGBA";
	rename -uid "E09F54A6-F040-322A-9FFF-23AEAFCA400C";
	setAttr ".aovn" -type "string" "RGBA";
createNode aiAOV -n "aiAOV_N";
	rename -uid "1518A7AB-BE42-8264-CC8E-6CA85ED37696";
	setAttr ".aovn" -type "string" "N";
	setAttr ".aovt" 7;
createNode aiAOVFilter -n "aiAOVFilter1";
	rename -uid "5EDADEFB-B54D-DFDC-D070-67B64A5EFADB";
	setAttr ".ai_translator" -type "string" "closest";
createNode lentil_operator -n "lentil_operator1";
<<<<<<< HEAD
	rename -uid "9504FFF0-4B90-CF31-7EF0-E3B19389A558";
createNode aiAOV -n "aiAOV_N";
	rename -uid "458AB44C-431E-C0EC-32BB-2E9BF1EEBB0E";
	setAttr ".aovn" -type "string" "N";
	setAttr ".aovt" 7;
createNode aiAOVFilter -n "aiAOVFilter1";
	rename -uid "04672E88-436A-85AB-9965-85A9192A3328";
	setAttr ".ai_translator" -type "string" "closest";
createNode aiAOV -n "aiAOV_P";
	rename -uid "0D31CFAD-4921-E48A-804E-10BC7725BBC9";
	setAttr ".aovn" -type "string" "P";
	setAttr ".aovt" 7;
createNode aiAOVFilter -n "aiAOVFilter2";
	rename -uid "9C43FA3F-49B4-3DD8-CD85-01A9D47E20E0";
	setAttr ".ai_translator" -type "string" "closest";
createNode aiAOV -n "aiAOV_RGBA";
	rename -uid "EC3FD138-4F3A-EB73-F042-DC92B3F935DD";
	setAttr ".aovn" -type "string" "RGBA";
=======
	rename -uid "96448DDA-8747-F8E0-6A68-78A0D53F69BA";
createNode aiLentilImager -n "aiLentilImager1";
	rename -uid "01EB5F0C-0E41-C302-646D-90B82283E17D";
>>>>>>> 8190a96cbf5a8737877912818ae126aa119bca5b
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 4 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :lightList1;
	setAttr -s 52 ".l";
select -ne :initialShadingGroup;
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ro" yes;
<<<<<<< HEAD
	setAttr -s 3 ".aovs";
	setAttr ".aovs[0].aov_name" -type "string" "N";
	setAttr ".aovs[1].aov_name" -type "string" "P";
	setAttr ".aovs[2].aov_name" -type "string" "RGBA";
	setAttr ".aal" -type "attributeAlias" {"ai_aov_N","aiCustomAOVs[0].aovName","ai_aov_P"
		,"aiCustomAOVs[1].aovName","ai_aov_RGBA","aiCustomAOVs[2].aovName"} ;
select -ne :initialParticleSE;
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ro" yes;
	setAttr -s 3 ".aovs";
	setAttr ".aovs[0].aov_name" -type "string" "N";
	setAttr ".aovs[1].aov_name" -type "string" "P";
	setAttr ".aovs[2].aov_name" -type "string" "RGBA";
	setAttr ".aal" -type "attributeAlias" {"ai_aov_N","aiCustomAOVs[0].aovName","ai_aov_P"
		,"aiCustomAOVs[1].aovName","ai_aov_RGBA","aiCustomAOVs[2].aovName"} ;
=======
	setAttr -s 2 ".aovs";
	setAttr ".aovs[0].aov_name" -type "string" "RGBA";
	setAttr ".aovs[1].aov_name" -type "string" "N";
	setAttr ".aal" -type "attributeAlias" {"ai_aov_RGBA","aiCustomAOVs[0].aovName","ai_aov_N"
		,"aiCustomAOVs[1].aovName"} ;
select -ne :initialParticleSE;
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ro" yes;
	setAttr -s 2 ".aovs";
	setAttr ".aovs[0].aov_name" -type "string" "RGBA";
	setAttr ".aovs[1].aov_name" -type "string" "N";
	setAttr ".aal" -type "attributeAlias" {"ai_aov_RGBA","aiCustomAOVs[0].aovName","ai_aov_N"
		,"aiCustomAOVs[1].aovName"} ;
>>>>>>> 8190a96cbf5a8737877912818ae126aa119bca5b
select -ne :defaultRenderGlobals;
	setAttr ".ren" -type "string" "arnold";
	setAttr ".outf" 51;
	setAttr ".imfkey" -type "string" "exr";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultLightSet;
	setAttr -s 52 ".dsm";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr "lentil_operator1.msg" ":defaultArnoldRenderOptions.operator";
connectAttr "aiLentilImager1.msg" ":defaultArnoldRenderOptions.imagers" -na;
<<<<<<< HEAD
connectAttr "aiAOV_N.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_P.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_RGBA.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr ":defaultArnoldRenderOptions.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr ":defaultArnoldDriver.msg" "aiAOV_N.out[0].drvr";
connectAttr "aiAOVFilter1.msg" "aiAOV_N.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_P.out[0].drvr";
connectAttr "aiAOVFilter2.msg" "aiAOV_P.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_RGBA.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_RGBA.out[0].ftr";
=======
connectAttr "aiAOV_RGBA.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_N.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr ":defaultArnoldRenderOptions.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr ":defaultArnoldDriver.msg" "aiAOV_RGBA.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_RGBA.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_N.out[0].drvr";
connectAttr "aiAOVFilter1.msg" "aiAOV_N.out[0].ftr";
>>>>>>> 8190a96cbf5a8737877912818ae126aa119bca5b
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "pointLightShape1.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape2.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape3.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape4.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape5.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape6.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape7.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape8.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape9.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape10.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape11.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape12.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape13.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape14.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape15.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape16.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape17.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape18.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape19.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape20.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape21.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape22.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape23.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape24.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape25.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape26.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape27.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape28.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape29.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape30.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape31.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape32.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape33.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape34.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape35.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape36.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape37.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape38.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape39.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape40.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape41.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape42.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape43.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape44.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape45.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape46.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape47.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape48.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape49.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape50.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape51.ltd" ":lightList1.l" -na;
connectAttr "pointLightShape52.ltd" ":lightList1.l" -na;
connectAttr "pointLight1.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight2.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight3.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight4.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight5.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight6.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight7.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight8.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight9.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight10.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight11.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight12.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight13.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight14.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight15.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight16.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight17.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight18.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight19.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight20.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight21.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight22.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight23.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight24.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight25.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight26.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight27.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight28.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight29.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight30.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight31.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight32.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight33.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight34.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight35.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight36.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight37.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight38.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight39.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight40.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight41.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight42.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight43.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight44.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight45.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight46.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight47.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight48.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight49.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight50.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight51.iog" ":defaultLightSet.dsm" -na;
connectAttr "pointLight52.iog" ":defaultLightSet.dsm" -na;
// End of lentil_base_setup_new.ma
