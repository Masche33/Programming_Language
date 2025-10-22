(* Definisco un tipo elemento per poterci lavorare con più facilità*)
type element = {
  name   : string; (* nome : tipo per definire un campo*)
  weight : int
};;

let metals = (* Mi definisco una lista degli elementi da lavorare*)
  {name="Beryllium"; weight=4}::
  {name="Magnesium"; weight=12}::
  {name="Calcium"  ; weight=20}::
  {name="Strontium"; weight=38}::
  {name="Barium"   ; weight=56}::(*Appendo ogni elemento in testa*)
  {name="Radium"   ; weight=88}::(*:: serve per ottenere una lista con come testa 
                                   il valore a sinistra e coda la lista a destra.
                                   In questo caso attaccando un tipo elemento a una 
                                   lista vuota ottengo una lista di element. Prima [] è di tipo 
                                   'a list.*)
  [](*Prendo la lista vuota*);;
let gases = 
  {name="Helium"  ; weight=2}::
  {name="Neon"    ; weight=10}::
  {name="Argon"   ; weight=18}::
  {name="Krypton" ; weight=36}::
  {name="Xenon"   ; weight=54}::
  {name="Radon"   ; weight=86}::
  [];;

let heaviest lst = (*Definisco un funziona e cui si passa un parametro che sarà inferito 'a list*)
  let rec heaviest acc lst = (*Creo una funzione ricorsiva che prende l'accumulatore e una lista,
                              l'accumulatore serve per la ricorsione di coda*)
    match lst with (*Applico il pattern matching sulla lista*)
    | []     -> acc (*Se sono in fondo alla lista restituisco il risultato della computazione, 
                      serve ad aver il pattern matching esaustivo*)
    | hd::[] -> if (hd.weight > acc.weight) then hd else acc(*hd::[] è una lista con un solo elemento e una coda
                                              uguale alla lista vuota*)
    | hd::tl -> if (hd.weight > acc.weight) then (*In questo caso la lista ha una testa e una coda che posso
                                                  referenziare in questo bracket*)
                  heaviest hd tl
                else
                  heaviest acc tl
    in heaviest (List.hd lst) (List.tl lst);;(* Serve a chiamare nella heavist esterna la heaviest interna e esser certi
                                               che la chiamata avvenga come inteso per la ricorsione di cosa.*)

let compare a b = a.weight - b.weight;; (* Più in là nel codice mi serve un comparatore di due elementi
                                           usando '.weight' forzo il meccanismo della type inference a 
                                          determinare che compare: element -> element -> int 
                                          L'int viene inferito dal tipo del campo weight.*)

let asc_sort lst =   (* List.sort chiede una funzione compare, che ho definito sopra, poi una list di element, 
                        questo perché List.sort ha la firma : ('a -> 'a -> int) 'a list. Se compare prende element allora la 
                        lista passata deve essere di element.
                        *)
  List.sort compare lst;;

let merge_list l1 l2 = (* Idem di asc_sort *)
  List.merge compare l1 l2;;

