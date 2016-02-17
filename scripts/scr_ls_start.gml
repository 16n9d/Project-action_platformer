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
if (argument_count > 0) {
    scr_ls_config(argument[0]);
} else {
    scr_ls_config(0.050);
}

/*
Creates a lightmap
*/
instance_create(0, 0, obj_ls_lightmap);
