<?php
namespace simpleal;

defined('ABSPATH') or die("No script hack please!");

//Settings for db queries cache 'TRUE - cache enabled'
$cache_db = false;
//How long cache sql query data will be used till expired
$cache_sql_expiration = 1800;

//Slides in per page mode
$slides_per_page = 6;

//Front slide indicator one side (full slides count = *2)
$slide_indicators_front_one_side = 8;

//For db upgrade
$simple_al_slider_db_version = "1.2";
?>