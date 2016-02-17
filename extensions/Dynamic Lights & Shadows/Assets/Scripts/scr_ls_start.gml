/*
-------- Dynamic Lights & Shadows Start Script
---- Here's where will be started the default scripts 
*/

/*
Load the global variables.
*/
scr_ls_global_variables();

/*
Set the configuration.
*/
scr_ls_config();

/*
Creates a lightmap
*/
instance_create(0, 0, obj_ls_lightmap);
