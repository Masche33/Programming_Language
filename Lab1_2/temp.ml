type scale = Celsius    |
             Fahrenheit | 
             Kelvin     |
             Rankine    | 
             Delisle    |
             Newton     | 
             Reamur     |
             Romer;;

type temperature = Temperature of (scale * float);;

let scales = [Celsius;
              Fahrenheit;
              Kelvin;
              Rankine;
              Delisle;
              Newton;
              Reamur;
              Romer];;

let anyToC t = 
  match t with
  | Temperature(Celsius, v)   -> t
  | Temperature(Fahrenheit, v)-> Temperature(Celsius, (v -. 32.) *. 5. /. 9. )
  | Temperature(Kelvin, v)    -> Temperature(Celsius, v -. 273.15)
  | Temperature(Rankine, v)   -> Temperature(Celsius, (v-.491.67)*. 5. /. 9.)
  | Temperature(Delisle, v)   -> Temperature(Celsius, 100. -. v *. 2. /. 3. )
  | Temperature(Newton, v)    -> Temperature(Celsius, v /. 33. *. 100.)
  | Temperature(Reamur, v)    -> Temperature(Celsius, v /. 4. *. 5.)
  | Temperature(Romer, v)     -> Temperature(Celsius, (v -. 7.5) *. 40. /. 21.);;

let cToAny (Temperature(_, v)) = function
| Celsius    -> Temperature(Celsius, v)
| Fahrenheit -> Temperature(Fahrenheit , (v *. 9. /. 5.) +. 32.)
| Kelvin     -> Temperature(Kelvin     , v +. 273.15)
| Rankine    -> Temperature(Rankine    , v *. 9. /. 5. +. 491.67)
| Delisle    -> Temperature(Delisle    , (100.-.v) /. 2. *. 3.)
| Newton     -> Temperature(Newton     , v *. 100. /. 33.)
| Reamur     -> Temperature(Reamur     , v *. 5. /. 4.)
| Romer      -> Temperature(Romer      , v /. 40. *. 21. +. 7.5);;

let allScales t =
  let rec allScales acc t s =
    match s with
    | []     -> List.rev acc
    | hd::tl -> allScales ((cToAny t hd )::acc) t tl
  in allScales [] (anyToC t) scales;;
