<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title></title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta http-equiv="cleartype" content="on">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge，chrome=1">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<link rel="shortcut icon" href="" type="image/x-icon">
<link rel="apple-touch-icon" sizes="57x57" href="">
<link rel="apple-touch-icon" sizes="72x72" href="">
<link rel="apple-touch-icon" sizes="114x114" href="">
<link rel="apple-touch-icon" sizes="144x144" href="">
<link rel="stylesheet" href="https://g.alicdn.com/de/prismplayer/2.7.4/skins/default/aliplayer-min.css" />
<link href="./css/style.css?a0e96b3476e0c8ab980a" rel="stylesheet">
</head>
<body>
	<div id="app"></div>
	<script type="text/javascript" src="./js/lib/jquery.min.js"></script>
	<script charset="utf-8" type="text/javascript" src="https://g.alicdn.com/de/prismplayer/2.7.4/aliplayer-min.js"></script>
	<script>
		videoList = [{
			VideoId : 0,
			source : "${goods.gvsrc}",
			CoverURL : "${goods.gimages}",
			Title : "${goods.gname}",
			Duration : "${goods.gduration}",
			Description : "${goods.gdetail}"
		}];
		/**
		{
			  VideoId: 0,
			  source: 'https://vod.olympicchannel.com/NBCR_Production_-_OCS/231/1016/GEPH-ONTHERECS02E012C-_E17101101_master.m3u8',
			  CoverURL: 'http://vod-download.cn-shanghai.aliyuncs.com/video-list-img/cctv5plus.png',
			  Title: 'ARGENTINA SCORE FOOTBALL PERFECTION IN ATHENS',
			  Duration: '05:37',
			  Description: 'The star-studded Argentina football team went on a formidable run to secure an historic gold medal at the Olympic Games Athens 2004.'
			}, {
			  VideoId: 1,
			  source: 'https://vod.olympicchannel.com/NBCR_Production_-_OCS/233/968/GEPH-ONTHERECS02E015C-_E17101101_master.m3u8',
			  CoverURL: 'http://vod-download.cn-shanghai.aliyuncs.com/video-list-img/cctv5.jpeg',
			  Title: 'THE YOUNGEST OLYMPIC CHAMPIONS IN HISTORY',
			  Duration: '04:11',
			  Description: 'From teenage divers to Sonja Henie and the boy with no name - a closer look at the youngest champions in Olympic history.'
			}, {
			  VideoId: 2,
			  source: 'https://vod.olympicchannel.com/NBCR_Production_-_OCS/233/968/GEPH-ONTHERECS02E017C-_E17101101_master.m3u8',
			  CoverURL: 'http://vod-download.cn-shanghai.aliyuncs.com/video-list-img/cctv11.jpeg',
			  Title: 'LAVILLENIE CLAIMS POLE VAULT RECORD IN LONDON 2012',
			  Duration: '05:00',
			  Description: 'French pole vaulter Renaud Lavillenie loves motorsport and drives to reach new heights, as shown by his success at London 2012 Olympics.'
			}, {
			  VideoId: 3,
			  source: 'https://vod.olympicchannel.com/NBCR_Production_-_OCS/1003/564/GEPH-ONTHERECS02E014C-_E17101101_master.m3u8',
			  CoverURL: 'http://vod-download.cn-shanghai.aliyuncs.com/video-list-img/cctv13.jpeg',
			  Title: "UNRIVALLED FISCHER'S REMARKABLE GOLD MEDAL RUN",
			  Duration: '05:46',
			  Description: 'A closer look at German veteran kayaker Birgit Fischer, who competed at six Olympic Games and won an incredible eight gold medals.'
			}, {
			  VideoId: 4,
			  source: 'https://vod.olympicchannel.com/NBCR_Production_-_OCS/71/856/GEPH-ONTHERECS02E016C-_E17101101_master.m3u8',
			  CoverURL: 'http://vod-download.cn-shanghai.aliyuncs.com/video-list-img/cctv4.jpeg',
			  Title: 'DEVERS PIPS OTTEY IN DRAMATIC 100M IN ATLANTA 1996',
			  Duration: '04:19',
			  Description: 'Gail Devers edges out Merlene Ottey in a thrilling photo finish Olympic 100m final at Atlanta 1996 that could barely have been any closer.'
			}
		 */
	</script>
	<script type="text/javascript" src="./js/playerdemo.js?a0e96b3476e0c8ab980a"></script>
</body>
</html>


