#!/bin/bash


echo """
#ifdef KEYMAP_IN_EEPROM_ENABLE
uint16_t keys_count(void) {
    return sizeof(keymaps) / sizeof(keymaps[0]) * MATRIX_ROWS * MATRIX_COLS;
}

uint16_t fn_actions_count(void) {
    return sizeof(fn_actions) / sizeof(fn_actions[0]);
}
#endif

/*
* Action macro definition
*/
enum macro_id {
    KEYPAD_00 = 0,
};

const macro_t *action_get_macro(keyrecord_t *record, uint8_t id, uint8_t opt)
{
    switch (id) {
        case KEYPAD_00:
             return (record->event.pressed ?
                     MACRO( T(P0), T(P0), END ) :
                     MACRO_NONE );
    }
    return MACRO_NONE;
}
""" >> keymap.c


cp keymap.c ../AMJ60/src/keymap_self.c
cd ../AMJ60/src
make KEYMAP=self
cd -
mv ../AMJ60/src/AMJ60_lufa.hex gh60_Amj60.hex
