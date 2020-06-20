use std::{env, error::Error};
use walkdir::{DirEntry, WalkDir};
use std::io::{BufReader, BufRead};
use regex::RegexSetBuilder;
use std::fs::File;

fn main() -> Result<(), Box<dyn Error>> {
    let args: Vec<_> = env::args().collect();
    let mut initial_path = ".";

    if args.len() != 1 {
        initial_path = &args[1];
    }

    println!("Walking dir from {}", initial_path);
    // let walker = WalkDir::new(initial_path).follow_links(true).into_iter();
    // for entry in walker.filter_entry(|e| !is_hidden(e)) {
    //     let f_name = entry.path();
    //     println!("{}", f_name);
    // }

    let walker = WalkDir::new(initial_path).into_iter();
    for entry in walker.filter_map(|e| e.ok()) {
        find_annotated_comment(&entry);
    }

    Ok(())
}

fn find_annotated_comment(entry: &DirEntry) {
    if entry.file_type().is_dir() { return }
    // println!("Looking for TODOs in {}", entry.path().display());

    let file = BufReader::new(File::open(&entry.path()).unwrap());
    let set = RegexSetBuilder::new(&[
        r#"TODO:"#
    ]).case_insensitive(true).build().unwrap();
    file
        .lines()
        .filter_map(|line| line.ok())
        .filter(|line| set.is_match(line.as_str()))
        .for_each(|x| println!("{}", x));
}

// TODO: improve is_hidden detection. if we set the path to '.' it'll ignore
// everything because it looks for starts_with .
fn is_hidden(entry: &DirEntry) -> bool {
    entry.file_name()
        .to_str()
        .map(|s| s.starts_with("."))
        .unwrap_or(false)
}

// fn wc() {
//     let mut lines = 0;
//     let mut words = 0;
//     let mut chars = 0;

//     let args: Vec<_> = env::args().collect();
//     if args.len() == 1 {
//         println!("Usage: {} text_file(s)", args[0]);
//         return;
//     }

//     let n_args = args.len();
//     for x in 1..n_args {
//         let mut total_lines = 0;
//         let mut total_words = 0;
//         let mut total_chars = 0;

//         let input_path = ::std::env::args().nth(x).unwrap();
//         let file = BufReader::new(File::open(&input_path).unwrap());
//         for line in file.lines() {
//             let my_line = line.unwrap();
//             total_lines = total_lines + 1;
//             total_words += my_line.split_whitespace().count();
//             total_chars = total_chars + my_line.len() + 1;
//         }

//         println!("\t{}\t{}\t{}\t{}", total_lines, total_words, total_chars, input_path);
//         lines += total_lines;
//         words += total_words;
//         chars += total_chars;
//     }

//     if n_args-1 != 1 {
//         println!("\t{}\t{}\t{}\ttotal", lines, words, chars);
//     }
// }
