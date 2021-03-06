
#define MIDDLE_CLICK FALSE
#define ALT_CLICK TRUE
#define CTRL_CLICK 2
#define MAX_HARDSUIT_CLICK_MODE 2

/client
	var/hardsuit_click_mode = MIDDLE_CLICK
/*
/client/verb/toggle_hardsuit_mode()
	set name = "Toggle Hardsuit Activation Mode"
	set desc = "Switch between hardsuit activation modes."
	set category = "OOC"

	hardsuit_click_mode++
	if (hardsuit_click_mode > MAX_HARDSUIT_CLICK_MODE)
		hardsuit_click_mode = FALSE

	switch(hardsuit_click_mode)
		if (MIDDLE_CLICK)
			src << "Hardsuit activation mode set to middle-click."
		if (ALT_CLICK)
			src << "Hardsuit activation mode set to alt-click."
		if (CTRL_CLICK)
			src << "Hardsuit activation mode set to control-click."
		else
			// should never get here, but just in case:
			soft_assert(0, "Bad hardsuit click mode: [hardsuit_click_mode] - expected FALSE to [MAX_HARDSUIT_CLICK_MODE]")
			src << "Somehow you bugged the system. Setting your hardsuit mode to middle-click."
			hardsuit_click_mode = MIDDLE_CLICK
*/
/mob/living/MiddleClickOn(atom/A)
	if (client && client.hardsuit_click_mode == MIDDLE_CLICK)
		if (HardsuitClickOn(A))
			return
	..()

/mob/living/AltClickOn(atom/A)
	if (client && client.hardsuit_click_mode == ALT_CLICK)
		if (HardsuitClickOn(A))
			return
	..()

/mob/living/CtrlClickOn(atom/A)
	if (client && client.hardsuit_click_mode == CTRL_CLICK)
		if (HardsuitClickOn(A))
			return
	..()

/mob/living/proc/can_use_rig()
	return FALSE

/mob/living/carbon/human/can_use_rig()
	return TRUE

/mob/living/carbon/brain/can_use_rig()
	return FALSE

/mob/living/proc/HardsuitClickOn(var/atom/A, var/alert_ai = FALSE)
	return FALSE

#undef MIDDLE_CLICK
#undef ALT_CLICK
#undef CTRL_CLICK
#undef MAX_HARDSUIT_CLICK_MODE
