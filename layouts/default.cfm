<cfoutput>
	<!DOCTYPE html>
	<html>
		<head>
			<title>#APPLICATION.siteSettings.getSitename()#</title>
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<!-- Bootstrap CSS -->
			<link href="#REQUEST.includesPath#/css/bootstrap.min.css" rel="stylesheet" media="screen">
			<link href="#REQUEST.includesPath#/css/font-awesome.min.css" rel="stylesheet" media="screen">
		</head>
		<body>
			<div class="container">
				#body#
			</div>
			<footer>
				<div class="container">
					&copy; #year(now())# #(len(APPLICATION.siteSettings.getCopyrightName())?APPLICATION.siteSettings.getCopyrightName():APPLICATION.siteSettings.getSitename())#
				</div>
			</footer>

			<!-- jQuery -->
			<script src="#REQUEST.includesPath#/js/jquery-1.10.2.min.js"></script>
			<!-- Bootstrap JavaScript -->
			<script src="#REQUEST.includesPath#/js/bootstrap.min.js"></script>
		</body>
	</html>

</cfoutput>