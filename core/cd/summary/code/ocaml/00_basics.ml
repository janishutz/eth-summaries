(* comments are like this and can be nested *)
let a_function (a : int) (b : int) : int = a * b

(* We can use the following to print ANYTHING upon execution *)
let () = Printf.printf "Format String (just like C's printf)"

(* We can also use ; to sepearate statements. The last statement's value is returned
 Furthermore, this definition of `a_function` shadows the previous one *)
let a_function (a : int) : int =
  Printf.printf "Print anything here";
  a * a

let vars_in_func (a : int) =
  let x = a_function a in
  Printf.printf "Value is %d" x

(* This is a simple example of a generic funciton and pattern matching *)
let is_empty (a : 'a list) : bool =
  match a with
  | [] -> true
  | _ :: _ -> false (* The underscores are, just like in Haskell, wildcards *)

let if_func (v1 : string) (v2 : string) : string =
  if v1 = v2 then "match" else "no match"

(* Recursive function *)
let rec double_all (arg : int list) : int list =
  match arg with [] -> [] | a :: al -> (a * a) :: double_all al

(* Recursive Tail function. This is more efficient than the above because it's compiled
to a simple loop. Furthermore, the fold functions behave in this way *)
let double_all_t (arg : int list) : int list =
  let rec aux a acc = match a with [] -> acc | v :: vl -> aux vl (v :: acc) in
  List.rev (aux arg [])

let print_list (list : 'a list) = List.iter (Printf.printf "%d") list
