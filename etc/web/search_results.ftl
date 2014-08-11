<!DOCTYPE html>
<html>
<head>
    	  <title>Search Page</title>
          <!-- Bootstrap core CSS -->
          <link href="../css/bootstrap.min.css" rel="stylesheet">
          <!-- Bootstrap theme -->
          <link href="../css/bootstrap-theme.min.css" rel="stylesheet">
          

          <!-- Custom styles for this template -->
          <link href="../assets/theme.css" rel="stylesheet">

          <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
          <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
          <![endif]-->
          
          <style = text/css>
             !decrease navbar size
             .navbar-nav > li > a {padding-top:5px !important; padding-bottom:5px !important;}
             .navbar {min-height:32px !important}
             
             .badge {
  				padding: 1px 9px 2px;
  				font-size: 09.025px;
  				font-weight: bold;
  				white-space: nowrap;
  				color: #ffffff;
  				background-color: #999999;
  				-webkit-border-radius: 9px;
  				-moz-border-radius: 9px;
  				border-radius: 9px;
			  }
			  .badge:hover {
  				color: #ffffff;
  				text-decoration: none;
  				cursor: pointer;
			  }
          </style>
</head>
<body>
      <!-- Fixed navbar -->
      <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      </div>

  <div class="row"> <!-- row 1: top of the page with search elems -->
	  <div class="col-md-2">
	  </div>
	  <div class="col-md-8">
	     <form class="form-horizontal" role="form" method='GET' action="/search/results">
	  
	      <!--<div class="form-group">-->
	      <div class="input-group">
	         <input name="search-terms" type="text" value="${search_terms}" class="form-control">
	         <input type="hidden" name="from" value="0" />
	         <input type="hidden" name="size" value="10" />
	           <span class="input-group-btn">
	             <button class="btn btn-default" type="submit">Search</button>
	           </span>
	      </div><!-- /input-group -->
	     </form><!-- /.form -->
	  </div>
	  <div class="col-md-2">
	  </div>
  </div> <!-- row 1 -->
  
  <div class="row"> <!-- row 2 contains hits and so on -->
      <div class="col-md-1">
        
	  </div>
	  <div class="col-md-10">
	     </br>
	     <p class="text-muted">
	       <small>About ${total_hits} results (${elapsed} milliseconds)</small>
	     </p>
	  </div>
  </div>
  <div class="row"> <!-- row 3 with the results -->
	  <div class="col-md-2">
	        <ul id="sidebar" class="nav nav-stacked affix">
            <#list facets?keys as facet>
               <a href="#sec0">${facet}<span class="badge pull-right">${facets[facet].total}</span></a>
               <ul class="nav">
	               <#list facets[facet].terms as aterm>
	                   <li class=""><small><a href="#">- ${aterm.term}<span class="badge pull-right">${aterm.count}</span></small></a></li>
	               </#list>
               </ul>
            </#list>
           </ul>
	  </div>
	  <div class="col-md-8">
	     <#list hits as hit>
	         <h5><a href="/product_description?id=${hit.id}">${hit.title}</a></h5>
	         <p class="text-justify">
	           ${hit.abstract} 
	         </p>
	         <p class="text-muted"><small>score: ${hit.score}</small></p>
	         <hr>
	     </#list>
	  </div>
 </div> <!-- row 3 -->
 <div class="row"> <!-- row 4: pagination -->
 <div class="text-center">
	<ul class="pagination">
	  <#assign curr=pagination.current_page>
	  <#if curr == 0 >
	     <li class="disabled"><a href="#">&laquo;</a></li>
	  <#else>
	     <li class="#"><a href="/search/results?search-terms=${search_terms}&from=${pagination.elem_per_page * (curr -1)}&size=${pagination.elem_per_page}">&laquo;</a></li>
	  </#if>
	  <#list 1..pagination.nb_pages as index>
	     <#if curr == (index-1)>
	        <li class="active"><a href="#">${index}</a></li>
	     <#else>
	        <li><a href="/search/results?search-terms=${search_terms}&from=${pagination.elem_per_page * (index - 1)}&size=${pagination.elem_per_page}">${index}</a></li>
	     </#if>
	  </#list>
	  <#if curr == (pagination.nb_pages-1) >
	     <li class="disabled"><a href="#">&laquo;</a></li>
	  <#else>
	     <li class="#"><a href="/search/results?search-terms=${search_terms}&from=${pagination.elem_per_page * (curr +1)}&size=${pagination.elem_per_page}">&raquo;</a></li>
	  </#if>
	</ul>
 </div>
</body>
</html>