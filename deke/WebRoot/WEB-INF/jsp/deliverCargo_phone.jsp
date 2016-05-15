<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta name="robots" content="index, follow" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="author" content="" />
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="dist/css/vendor/bootstrap.min.css">
		<link rel="stylesheet"  type="text/css" href="dist/css/flat-ui.css">
	</head>
	<body>
	    <style>
      body {
        padding-bottom: 200px;
      }
    </style>
    <div class="container">
      <h4>Select</h4>

      <h6>Big string</h6>
      <form action="#" type="get">
        <select data-toggle="select" class="form-control select select-default mrs mbm">
          <option value="0">My Profile</option>
          <option value="1">My Friends</option>
          <option value="2">My Profile</option>
          <option value="3">My Friends</option>
        </select>

        <input type="submit" value="Submit" class="btn">

      </form>

      <h6>Optroups</h6>

      <select data-toggle="select" class="form-control select select-default mrs mbm">
        <optgroup label="Profile">
          <option value="0">My Profile</option>
          <option value="1">My Friends</option>
        </optgroup>
        <optgroup label="System">
          <option value="2">Messages</option>
          <option value="3">My Settings</option>
          <option value="4">Logout</option>
        </optgroup>
      </select>

      <h6>Disabled Select</h6>

      <select data-toggle="select" class="form-control select select-default mrs mbm" disabled>
        <option value="0" disabled>My Profile</option>
        <option value="1">My Friends</option>
        <option value="2">Messages</option>
        <option value="3" disabled>My Settings</option>
        <option value="4">Logout</option>
      </select>

      <h6>Disabled Options</h6>

      <select data-toggle="select" class="form-control select select-default mrs mbm">
        <option value="0" disabled>My Profile</option>
        <option value="1">My Friends</option>
        <option value="2">Messages</option>
        <option value="3" disabled>My Settings</option>
        <option value="4">Logout</option>
      </select>

      <h6>Inversed Dropdown</h6>

      <select data-toggle="select" name="inverse-dropdown" class="form-control select select-default mrs mbm">
        <option value="0">My Profile</option>
        <option value="1">My Friends</option>
        <option value="2">Messages</option>
        <option value="3">My Settings</option>
        <option value="4">Logout</option>
      </select>

      <h6>Inversed Dropdown + Optgroups</h6>

      <select data-toggle="select" name="inverse-dropdown-optgroup" class="form-control select select-default mrs mbm">
        <optgroup label="Profile">
          <option value="0">My Profile</option>
          <option value="1">My Friends</option>
        </optgroup>
        <optgroup label="System">
          <option value="2">Messages</option>
          <option value="3">My Settings</option>
          <option value="4">Logout</option>
        </optgroup>
      </select>

      <h6>Inversed Dropdown + Disabled Options</h6>

      <select data-toggle="select" name="inverse-dropdown-disabled" class="form-control select select-default mrs mbm">
        <option value="0" disabled>My Profile</option>
        <option value="1">My Friends</option>
        <option value="2">Messages</option>
        <option value="3" disabled>My Settings</option>
        <option value="4">Logout</option>
      </select>

      <h6>Visible search field</h6>

      <select data-toggle="select" name="searchfield" class="form-control select select-default mrs mbm">
        <option value="0">My Profile</option>
        <option value="1">My Friends</option>
        <option value="2">Messages</option>
        <option value="3">My Settings</option>
        <option value="4">Logout</option>
      </select>

      <h6>Inversed Dropdown + Visible search field</h6>

      <select data-toggle="select" name="inverse-dropdown-searchfield" class="form-control select select-default mrs mbm">
        <option value="0">My Profile</option>
        <option value="1">My Friends</option>
        <option value="2">Messages</option>
        <option value="3">My Settings</option>
        <option value="4">Logout</option>
      </select>

      <h6>Color variants</h6>

      <select data-toggle="select" class="form-control select select-default mrs mbm">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Friends</option>
      </select>

      <select data-toggle="select" class="form-control select select-inverse mrs mbm">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Friends</option>
      </select>

      <select data-toggle="select" class="form-control select select-primary mrs mbm">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Friends</option>
      </select>

      <select data-toggle="select" class="form-control select select-info mrs mbm">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Friends</option>
      </select>

      <select data-toggle="select" class="form-control select select-danger mrs mbm">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Friends</option>
      </select>

      <select data-toggle="select" class="form-control select select-success mrs mbm">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Friends</option>
      </select>

      <select data-toggle="select" class="form-control select select-warning mrs">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Friends</option>
      </select>

      <h6>Custom sizes</h6>

      <select data-toggle="select" class="form-control select select-default select-hg mrs">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Dear Friends</option>
      </select>

      <select data-toggle="select" class="form-control select select-default select-lg mrs">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Dear Friends</option>
      </select>

      <select data-toggle="select" class="form-control select select-default mrs">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Dear Friends</option>
      </select>

      <select data-toggle="select" class="form-control select select-default select-sm mrs">
        <option value="0">My Profile here is</option>
        <option value="1">My Friends</option>
        <option value="2">My Profile</option>
        <option value="3">My Dear Friends</option>
      </select>

      <h6>Select with .form-group</h6>

      <div class="form-group">
        <select data-toggle="select" class="form-control select select-primary select-lg">
          <option value="0">My Profile here is</option>
          <option value="1">My Friends</option>
          <option value="2">My Profile</option>
          <option value="3">My Friends</option>
        </select>
      </div>

      <div class="form-group">
        <select data-toggle="select" class="form-control select select-inverse">
          <option value="0">My Profile here is</option>
          <option value="1">My Friends</option>
          <option value="2">My Profile</option>
          <option value="3">My Dear Friends</option>
        </select>
      </div>

      <br><br>

      <h4>Multi select</h4>

      <h6>Big string</h6>

      <select data-toggle="select" multiple class="form-control multiselect multiselect-default">
        <option value="0" selected>Одиннадцатиклассница рентгеноэлектрокардиографическая</option>
        <option value="2">3 option</option>
        <option value="3">4 option</option>
        <option value="4">5 option</option>
      </select>

      <h6>Color variants</h6>

      <select data-toggle="select" multiple class="form-control multiselect multiselect-default mrs mbm">
        <option value="0" selected>1 option</option>
        <option value="1">2 option</option>
        <option value="2" selected>3 option</option>
        <option value="3">4 option</option>
        <option value="4">5 option</option>
      </select>

      <select data-toggle="select" multiple class="form-control multiselect multiselect-inverse mrs mbm">
        <option value="0" selected>1 option</option>
        <option value="1">2 option</option>
        <option value="2" selected>3 option</option>
        <option value="3">4 option</option>
        <option value="4">5 option</option>
      </select>

      <select data-toggle="select" multiple class="form-control multiselect multiselect-primary mrs mbm">
        <option value="0" selected>1 option</option>
        <option value="1">2 option</option>
        <option value="2" selected>3 option</option>
        <option value="3">4 option</option>
        <option value="4">5 option</option>
      </select>

      <select data-toggle="select" multiple class="form-control multiselect multiselect-info mrs mbm">
        <option value="0" selected>1 option</option>
        <option value="1">2 option</option>
        <option value="2" selected>3 option</option>
        <option value="3">4 option</option>
        <option value="4">5 option</option>
      </select>

      <select data-toggle="select" multiple class="form-control multiselect multiselect-danger mrs mbm">
        <option value="0" selected>1 option</option>
        <option value="1">2 option</option>
        <option value="2" selected>3 option</option>
        <option value="3">4 option</option>
        <option value="4">5 option</option>
      </select>

      <select data-toggle="select" multiple class="form-control multiselect multiselect-success mrs mbm">
        <option value="0" selected>1 option</option>
        <option value="1">2 option</option>
        <option value="2" selected>3 option</option>
        <option value="3">4 option</option>
        <option value="4">5 option</option>
      </select>

      <select data-toggle="select" multiple class="form-control multiselect multiselect-warning mrs mbm">
        <option value="0" selected>1 option</option>
        <option value="1">2 option</option>
        <option value="2" selected>3 option</option>
        <option value="3">4 option</option>
        <option value="4">5 option</option>
      </select>

    </div><!-- /.container -->
			<script type="text/javascript" src="dist/js/vendor/jquery.min.js">
</script>
		<script type="text/javascript" src="dist/js/flat-ui.min.js">
</script>
		<script type="text/javascript" src="dist/application.js">
</script>
<script>
      $(document).ready(function(){
        $('select[name="inverse-dropdown"], select[name="inverse-dropdown-optgroup"], select[name="inverse-dropdown-disabled"]').select2({dropdownCssClass: 'select-inverse-dropdown'});
        $('select[name="searchfield"]').select2({dropdownCssClass: 'show-select-search'});
        $('select[name="inverse-dropdown-searchfield"]').select2({dropdownCssClass: 'select-inverse-dropdown show-select-search'});
      });
    </script>
	</body>
</html>
