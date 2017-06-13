(ns bob)
(require '[clojure.string :as str])

(defn response-for [phrase]
  (cond
    (and (= (str/upper-case phrase) phrase)
         (re-seq #"[A-Za-z]" phrase)) "Whoa, chill out!"
    (str/ends-with? phrase "?") "Sure."
    (str/blank? (str/trim phrase)) "Fine. Be that way!"
    :else "Whatever."))
