Dynamic Lights & Shadows

The Asset means to generate 2d lights, and generate shadows from objects who holds a instance of another object, called lightblocker.

You need to configure the system by the script scr_ls_config, just setting the values that you want to use.

After that, you can call lights by the scripts src_ls_light_create, and src_ls_light_create_ext. For the good use, you can call that from the object that you want to have a light. You can save the result from the script on a variable, so you can change the light later. You can see that on the example, by the mouse and when you click, you create a lightspot.

And for the last, but also important, the lightblockers. They react to the light objects, and starts to cast shadows from the cast points. The important part, you need to set the cast points using two arrays, they are positions inside the object who holds the lightblocker. You can do that by the script scr_ls_lightblocker_create and scr_ls_lightblocker_create_ext.

To put everything on use, you must start the system by the script "scr_ls_start()". In the example, that method is called on the creation code of the room. That script will instance the lightmap, and starts everything.

You can check on every script a explanation of that script, and how to use it with more details.

Any doubt, just send a email to adalberto.kutuxidis@gmail.com.