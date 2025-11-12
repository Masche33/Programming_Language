-module(strings).
-export([
        is_palindrome/1,
        is_anagrams/2
        ]).

is_palindrome(Str) -> Str == lists:reverse(Str).

is_anagram(Str1, Str2) -> lists:sort(Str1) == lists:sort(Str2).

is_anagrams(Str, [H | TL]) -> is_anagrams(is_anagram(Str, H), Str, TL).

is_anagrams(true, _, _)           -> true;
is_anagrams(false, Str, [H | TL]) -> is_anagrams(is_anagram(Str, H), Str, TL);
is_anagrams(_, _, [])             -> false.
