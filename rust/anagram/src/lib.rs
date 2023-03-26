use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let word = word.to_lowercase();

    let mut word_chars: Vec<char> = word.chars().collect();
    word_chars.sort_unstable();

    let mut result: HashSet<&str> = HashSet::new();

    for anagram in possible_anagrams {
        let lower_anagram = anagram.to_lowercase();

        if lower_anagram == word {
            continue;
        }

        let mut sorted: Vec<char> = lower_anagram.chars().collect();
        sorted.sort_unstable();

        if word_chars == sorted {
            result.insert(anagram);
        }
    }

    result
}
