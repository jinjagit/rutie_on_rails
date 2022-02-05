#![allow(improper_ctypes_definitions)] // Hide the 'not FFI-safe' warnings!

#[macro_use]
extern crate rutie_serde;

use rutie::{class, Object};
use rutie_serde::rutie_serde_methods;

class!(RustLib);

rutie_serde_methods!(
    RustLib,
    _itself,
    ruby_class!(Exception),

    fn pub_hello_world() -> String {
        format!("Rust says 'Hi!'")
    }

    fn pub_reverse(array: Vec<String>) -> Vec<String> {
        array.into_iter().rev().collect()
    }

    fn pub_find_blocked_words(text_array: Vec<String>, blocked_words: Vec<String>) -> Vec<String> {
        let mut found_words: Vec<String> = vec![];

        for val in text_array.iter() {
            if blocked_words.contains(&val) {
                found_words.push(val.to_string());
            }
        }

        found_words
    }
);

// Entrypoint function (that Ruby can call):
#[no_mangle]
pub extern "C" fn Init_rust_lib() {
    rutie::Class::new("RustLib", None).define(|itself| {
        itself.def_self("hello_world", pub_hello_world);
        itself.def_self("reverse", pub_reverse);
        itself.def_self("find_blocked_words", pub_find_blocked_words);
    });
}
