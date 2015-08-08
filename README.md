# RubyMotion Benchmark App

This is a benchmarking app for RubyMotion. As with any benchmarking, YMMV, and don't make sweeping judgments or decisions based on someone else's benchmarks.

Benchmark code is taken from here: https://github.com/JuanitoFatas/fast-ruby

Running benchmarks in RubyMotion:

```sh-session
$ bundle
$ rake mode=release
```

Running the original benchmarks in CRuby:

```sh-session
$ gem install benchmark-ips
$ find ./fast-ruby -name "*.rb" -exec ruby {} \;
```

### Results

MacBook Pro 13" Retina, late 2013 model, 8 GB memory, 2.4 GHz Intel Core i5

#### CRuby (MRI)

This uses [benchmark-ips](https://github.com/evanphx/benchmark-ips).

```
Calculating -------------------------------------
           Array#[0]   103.829k i/100ms
         Array#first   103.414k i/100ms
-------------------------------------------------
           Array#[0]      6.044M (±10.6%) i/s -     29.903M
         Array#first      5.295M (±15.3%) i/s -     25.647M

Comparison:
           Array#[0]:  6044121.8 i/s
         Array#first:  5295352.1 i/s - 1.14x slower

Calculating -------------------------------------
          Array#[-1]    82.331k i/100ms
          Array#last   105.282k i/100ms
-------------------------------------------------
          Array#[-1]      5.994M (±11.1%) i/s -     29.557M
          Array#last      5.561M (±10.0%) i/s -     27.479M

Comparison:
          Array#[-1]:  5993511.0 i/s
          Array#last:  5560866.9 i/s - 1.08x slower

Calculating -------------------------------------
                find     1.000  i/100ms
             bsearch    34.839k i/100ms
-------------------------------------------------
                find      0.151  (± 0.0%) i/s -      1.000  in   6.629845s
             bsearch    482.900k (± 7.7%) i/s -      2.404M

Comparison:
             bsearch:   482899.9 i/s
                find:        0.2 i/s - 3201551.61x slower

Calculating -------------------------------------
              #count   108.884k i/100ms
               #size   112.911k i/100ms
-------------------------------------------------
              #count      5.202M (±11.2%) i/s -     25.697M
               #size      6.196M (±10.9%) i/s -     30.599M

Comparison:
               #size:  6195799.8 i/s
              #count:  5201506.6 i/s - 1.19x slower

Calculating -------------------------------------
 Array#shuffle.first    22.176k i/100ms
        Array#sample    98.233k i/100ms
-------------------------------------------------
 Array#shuffle.first    269.772k (± 7.2%) i/s -      1.353M
        Array#sample      4.359M (±15.5%) i/s -     21.120M

Comparison:
        Array#sample:  4358706.0 i/s
 Array#shuffle.first:   269772.2 i/s - 16.16x slower

Calculating -------------------------------------
   Array#each + push     6.598k i/100ms
           Array#map     9.304k i/100ms
-------------------------------------------------
   Array#each + push     75.591k (±15.3%) i/s -    369.488k
           Array#map    125.648k (± 5.9%) i/s -    632.672k

Comparison:
           Array#map:   125648.1 i/s
   Array#each + push:    75591.2 i/s - 1.66x slower

Calculating -------------------------------------
            For loop    13.768k i/100ms
               #each    14.713k i/100ms
-------------------------------------------------
            For loop    154.948k (± 4.9%) i/s -    784.776k
               #each    150.787k (±16.5%) i/s -    735.650k

Comparison:
            For loop:   154947.7 i/s
               #each:   150786.7 i/s - 1.03x slower

Calculating -------------------------------------
     each_with_index     9.487k i/100ms
          While Loop    16.977k i/100ms
-------------------------------------------------
     each_with_index     99.132k (±12.1%) i/s -    493.324k
          While Loop    197.453k (± 4.1%) i/s -      1.002M

Comparison:
          While Loop:   197452.6 i/s
     each_with_index:    99132.1 i/s - 1.99x slower

Calculating -------------------------------------
Array#map.flatten(1)     2.214k i/100ms
   Array#map.flatten     1.632k i/100ms
      Array#flat_map     3.965k i/100ms
-------------------------------------------------
Array#map.flatten(1)     23.009k (±28.5%) i/s -    101.844k
   Array#map.flatten     26.257k (±15.0%) i/s -    128.928k
      Array#flat_map     45.416k (± 9.8%) i/s -    226.005k

Comparison:
      Array#flat_map:    45415.8 i/s
   Array#map.flatten:    26257.5 i/s - 1.73x slower
Array#map.flatten(1):    23008.7 i/s - 1.97x slower

Calculating -------------------------------------
  Array#reverse.each     9.469k i/100ms
  Array#reverse_each    13.556k i/100ms
-------------------------------------------------
  Array#reverse.each    148.215k (± 9.5%) i/s -    738.582k
  Array#reverse_each    155.971k (±13.2%) i/s -    772.692k

Comparison:
  Array#reverse_each:   155971.5 i/s
  Array#reverse.each:   148214.8 i/s - 1.05x slower

Calculating -------------------------------------
Enumerable#select.first
                         6.117k i/100ms
   Enumerable#detect    27.656k i/100ms
-------------------------------------------------
Enumerable#select.first
                         70.692k (±10.5%) i/s -      1.395M
   Enumerable#detect    327.733k (±13.2%) i/s -      6.416M

Comparison:
   Enumerable#detect:   327732.8 i/s
Enumerable#select.first:    70692.4 i/s - 4.64x slower

Calculating -------------------------------------
Enumerable#reverse.detect
                        42.953k i/100ms
Enumerable#select.last
                         7.640k i/100ms
-------------------------------------------------
Enumerable#reverse.detect
                        797.076k (±13.3%) i/s -      3.909M
Enumerable#select.last
                         82.013k (±21.5%) i/s -    382.000k

Comparison:
Enumerable#reverse.detect:   797075.5 i/s
Enumerable#select.last:    82013.2 i/s - 9.72x slower

Calculating -------------------------------------
     Enumerable#sort     1.010k i/100ms
  Enumerable#sort_by     1.880k i/100ms
-------------------------------------------------
     Enumerable#sort     10.143k (± 7.5%) i/s -     50.500k
  Enumerable#sort_by     19.901k (± 9.7%) i/s -     99.640k

Comparison:
  Enumerable#sort_by:    19901.0 i/s
     Enumerable#sort:    10142.7 i/s - 1.96x slower

Calculating -------------------------------------
 Parallel Assignment   102.499k i/100ms
Sequential Assignment
                       101.060k i/100ms
-------------------------------------------------
 Parallel Assignment      4.985M (± 9.1%) i/s -     24.702M
Sequential Assignment
                          4.485M (± 9.0%) i/s -     22.233M

Comparison:
 Parallel Assignment:  4984600.0 i/s
Sequential Assignment:  4484818.9 i/s - 1.11x slower

Calculating -------------------------------------
   getter_and_setter    73.643k i/100ms
       attr_accessor    75.720k i/100ms
-------------------------------------------------
   getter_and_setter      1.811M (±12.8%) i/s -      8.911M
       attr_accessor      2.115M (±13.6%) i/s -     10.374M

Comparison:
       attr_accessor:  2114591.1 i/s
   getter_and_setter:  1811079.7 i/s - 1.17x slower

Calculating -------------------------------------
      begin...rescue    21.574k i/100ms
         respond_to?    76.641k i/100ms
-------------------------------------------------
      begin...rescue    279.670k (±11.0%) i/s -      1.381M
         respond_to?      2.585M (±15.1%) i/s -     12.416M

Comparison:
         respond_to?:  2585483.3 i/s
      begin...rescue:   279670.4 i/s - 9.24x slower

Calculating -------------------------------------
              normal    64.781k i/100ms
             &method    26.015k i/100ms
-------------------------------------------------
              normal      1.294M (±13.2%) i/s -      6.349M
             &method    330.025k (±10.4%) i/s -      1.639M

Comparison:
              normal:  1294453.8 i/s
             &method:   330025.5 i/s - 3.92x slower

Calculating -------------------------------------
module_eval with string
                        93.000  i/100ms
       define_method   102.000  i/100ms
-------------------------------------------------
module_eval with string
                        798.844  (±22.3%) i/s -      3.813k
       define_method      1.121k (±23.6%) i/s -      5.304k

Comparison:
       define_method:     1120.8 i/s
module_eval with string:      798.8 i/s - 1.40x slower

Calculating -------------------------------------
              Hash[]    18.718k i/100ms
            Hash#dup    10.234k i/100ms
-------------------------------------------------
              Hash[]    238.535k (±12.8%) i/s -      1.179M
            Hash#dup    117.766k (±10.6%) i/s -    583.338k

Comparison:
              Hash[]:   238534.7 i/s
            Hash#dup:   117765.8 i/s - 2.03x slower

Calculating -------------------------------------
     Hash#[], symbol   103.060k i/100ms
  Hash#fetch, symbol    97.907k i/100ms
     Hash#[], string    91.953k i/100ms
  Hash#fetch, string    82.131k i/100ms
-------------------------------------------------
     Hash#[], symbol      5.137M (±12.8%) i/s -     25.250M
  Hash#fetch, symbol      4.558M (±11.3%) i/s -     22.519M
     Hash#[], string      4.472M (±15.1%) i/s -     21.701M
  Hash#fetch, string      2.625M (±15.8%) i/s -     12.730M

Comparison:
     Hash#[], symbol:  5136893.0 i/s
  Hash#fetch, symbol:  4557544.3 i/s - 1.13x slower
     Hash#[], string:  4472226.5 i/s - 1.15x slower
  Hash#fetch, string:  2624902.3 i/s - 1.96x slower

Calculating -------------------------------------
  Hash#fetch + block    90.740k i/100ms
    Hash#fetch + arg    62.715k i/100ms
-------------------------------------------------
  Hash#fetch + block      4.345M (±18.3%) i/s -     19.963M
    Hash#fetch + arg      3.170M (±12.8%) i/s -     15.553M

Comparison:
  Hash#fetch + block:  4344501.7 i/s
    Hash#fetch + arg:  3169859.7 i/s - 1.37x slower

Calculating -------------------------------------
      sort_by + to_h     6.899k i/100ms
         sort + to_h     5.792k i/100ms
-------------------------------------------------
      sort_by + to_h     78.748k (±13.7%) i/s -    386.344k
         sort + to_h     51.168k (±27.0%) i/s -    220.096k

Comparison:
      sort_by + to_h:    78748.5 i/s
         sort + to_h:    51167.6 i/s - 1.54x slower

Calculating -------------------------------------
      Hash#keys.each    42.366k i/100ms
       Hash#each_key    47.912k i/100ms
-------------------------------------------------
      Hash#keys.each    658.037k (±10.0%) i/s -      3.262M
       Hash#each_key    755.225k (±13.5%) i/s -      3.737M

Comparison:
       Hash#each_key:   755224.5 i/s
      Hash#keys.each:   658037.3 i/s - 1.15x slower

Calculating -------------------------------------
         Hash#merge!   798.000  i/100ms
            Hash#[]=     1.981k i/100ms
-------------------------------------------------
         Hash#merge!      7.753k (±10.5%) i/s -     38.304k
            Hash#[]=     22.290k (±18.5%) i/s -    108.955k

Comparison:
            Hash#[]=:    22289.8 i/s
         Hash#merge!:     7753.3 i/s - 2.87x slower

Calculating -------------------------------------
          Hash#merge    33.000  i/100ms
         Hash#merge!   835.000  i/100ms
-------------------------------------------------
          Hash#merge    343.255  (± 8.4%) i/s -      1.716k
         Hash#merge!      8.317k (± 6.2%) i/s -     41.750k

Comparison:
         Hash#merge!:     8316.8 i/s
          Hash#merge:      343.3 i/s - 24.23x slower

Calculating -------------------------------------
                call    85.441k i/100ms
                send    81.609k i/100ms
      method_missing    74.061k i/100ms
-------------------------------------------------
                call      3.089M (± 9.6%) i/s -     15.294M
                send      2.680M (± 8.2%) i/s -     13.302M
      method_missing      2.219M (± 8.3%) i/s -     11.035M

Comparison:
                call:  3088821.3 i/s
                send:  2679953.7 i/s - 1.15x slower
      method_missing:  2219290.1 i/s - 1.39x slower

Calculating -------------------------------------
               Block     3.735k i/100ms
      Symbol#to_proc     4.296k i/100ms
-------------------------------------------------
               Block     32.097k (±31.3%) i/s -    134.460k
      Symbol#to_proc     40.031k (±16.9%) i/s -    193.320k

Comparison:
      Symbol#to_proc:    40031.2 i/s
               Block:    32096.8 i/s - 1.25x slower

Calculating -------------------------------------
          block.call    46.549k i/100ms
               yield    93.189k i/100ms
-------------------------------------------------
          block.call      1.020M (±11.5%) i/s -      5.027M
               yield      4.532M (±11.6%) i/s -     22.365M

Comparison:
               yield:  4531779.6 i/s
          block.call:  1020478.7 i/s - 4.44x slower

Calculating -------------------------------------
        Range#cover?    58.584k i/100ms
      Range#include?     5.074k i/100ms
-------------------------------------------------
        Range#cover?      1.496M (±13.6%) i/s -      7.323M
      Range#include?     59.215k (±12.1%) i/s -    294.292k

Comparison:
        Range#cover?:  1495528.7 i/s
      Range#include?:    59215.1 i/s - 25.26x slower

Calculating -------------------------------------
String#downcase + ==    67.961k i/100ms
      String#casecmp    81.205k i/100ms
-------------------------------------------------
String#downcase + ==      2.448M (± 8.3%) i/s -     12.165M
      String#casecmp      2.865M (±12.1%) i/s -     14.048M

Comparison:
      String#casecmp:  2864614.9 i/s
String#downcase + ==:  2447611.3 i/s - 1.17x slower

Calculating -------------------------------------
            String#+    76.212k i/100ms
       String#concat    78.953k i/100ms
       String#append    79.640k i/100ms
         "foo" "bar"    95.274k i/100ms
-------------------------------------------------
            String#+      2.300M (± 7.4%) i/s -     11.508M
       String#concat      1.940M (±27.0%) i/s -      8.211M
       String#append      2.139M (±20.8%) i/s -      9.955M
         "foo" "bar"      3.738M (±18.4%) i/s -     17.626M

Comparison:
         "foo" "bar":  3737602.7 i/s
            String#+:  2300100.7 i/s - 1.62x slower
       String#append:  2138987.3 i/s - 1.75x slower
       String#concat:  1939682.8 i/s - 1.93x slower

Calculating -------------------------------------
           String#=~    30.656k i/100ms
    String#end_with?    68.862k i/100ms
-------------------------------------------------
           String#=~    644.263k (±15.6%) i/s -      3.096M
    String#end_with?      2.256M (±13.8%) i/s -     10.949M

Comparison:
    String#end_with?:  2256231.5 i/s
           String#=~:   644262.8 i/s - 3.50x slower

Calculating -------------------------------------
         String#gsub    24.426k i/100ms
          String#sub    24.319k i/100ms
-------------------------------------------------
         String#gsub    394.863k (± 7.8%) i/s -      1.979M
          String#sub    461.567k (±18.6%) i/s -      2.140M

Comparison:
          String#sub:   461567.3 i/s
         String#gsub:   394863.4 i/s - 1.17x slower

Calculating -------------------------------------
         String#gsub    29.992k i/100ms
           String#tr    59.424k i/100ms
-------------------------------------------------
         String#gsub    327.476k (±25.7%) i/s -      1.500M
           String#tr      1.279M (±25.5%) i/s -      5.824M

Comparison:
           String#tr:  1279171.4 i/s
         String#gsub:   327476.2 i/s - 3.91x slower

Calculating -------------------------------------
           String#=~    30.736k i/100ms
  String#start_with?    67.108k i/100ms
-------------------------------------------------
           String#=~    623.160k (±20.4%) i/s -      2.889M
  String#start_with?      3.057M (±14.6%) i/s -     14.965M

Comparison:
  String#start_with?:  3057431.2 i/s
           String#=~:   623159.7 i/s - 4.91x slower

Calculating -------------------------------------
  String#['string']=    39.449k i/100ms
 String#sub!'string'    30.994k i/100ms
String#gsub!'string'    22.259k i/100ms
  String#[/regexp/]=    32.326k i/100ms
 String#sub!/regexp/    28.434k i/100ms
String#gsub!/regexp/    16.856k i/100ms
-------------------------------------------------
  String#['string']=    723.731k (±10.9%) i/s -      3.590M
 String#sub!'string'    409.229k (±22.0%) i/s -      1.922M
String#gsub!'string'    274.317k (±16.6%) i/s -      1.336M
  String#[/regexp/]=    413.322k (±37.7%) i/s -      1.584M
 String#sub!/regexp/    379.751k (±17.4%) i/s -      1.820M
String#gsub!/regexp/    183.505k (±26.1%) i/s -    825.944k

Comparison:
  String#['string']=:   723730.9 i/s
  String#[/regexp/]=:   413322.2 i/s - 1.75x slower
 String#sub!'string':   409229.2 i/s - 1.77x slower
 String#sub!/regexp/:   379751.3 i/s - 1.91x slower
String#gsub!'string':   274317.3 i/s - 2.64x slower
String#gsub!/regexp/:   183504.8 i/s - 3.94x slower
```

#### RubyMotion

This uses [motion-benchmark-ips](https://github.com/Watson1978/motion-benchmark-ips).

```
         Array#first     58763 i/100ms
-------------------------------------------------
           Array#[0]  5182998.2 (±10.7%) i/s -   25548130 in   4.994566s
         Array#first  4466542.2 (±11.6%) i/s -   21977362 in   4.998364s

Comparison:
           Array#[0]:  5182998.2 i/s
         Array#first:  4466542.2 i/s - 1.16x slower

Calculating -------------------------------------
          Array#[-1]     66090 i/100ms
          Array#last     63116 i/100ms
-------------------------------------------------
          Array#[-1]  5341695.1 (±13.2%) i/s -   26105550 in   5.001711s
          Array#last  4473566.8 (±13.8%) i/s -   21838136 in   5.000235s

Comparison:
          Array#[-1]:  5341695.1 i/s
          Array#last:  4473566.8 i/s - 1.19x slower

Calculating -------------------------------------
                find         1 i/100ms
-------------------------------------------------
                find        0.2 (±0.0%) i/s -          2 in   8.861354s
Calculating -------------------------------------
              #count     54728 i/100ms
               #size     63779 i/100ms
-------------------------------------------------
              #count  4498200.5 (±9.4%) i/s -   22274296 in   5.004063s
               #size  4608072.0 (±11.1%) i/s -   22641545 in   4.996450s

Comparison:
               #size:  4608072.0 i/s
              #count:  4498200.5 i/s - 1.02x slower

Calculating -------------------------------------
 Array#shuffle.first     12279 i/100ms
        Array#sample     53057 i/100ms
-------------------------------------------------
 Array#shuffle.first   150590.8 (±9.5%) i/s -     749019 in   5.023434s
        Array#sample  3528497.7 (±18.9%) i/s -   16659898 in   4.993218s

Comparison:
        Array#sample:  3528497.7 i/s
 Array#shuffle.first:   150590.8 i/s - 23.43x slower

Calculating -------------------------------------
   Array#each + push      4102 i/100ms
           Array#map     11909 i/100ms
-------------------------------------------------
   Array#each + push    47587.3 (±20.5%) i/s -     229712 in   5.067975s
           Array#map   115327.9 (±18.0%) i/s -     559723 in   5.024672s

Comparison:
           Array#map:   115327.9 i/s
   Array#each + push:    47587.3 i/s - 2.42x slower

Calculating -------------------------------------
            For loop      9555 i/100ms
               #each     14509 i/100ms
-------------------------------------------------
            For loop   149001.4 (±12.2%) i/s -     735735 in   5.029222s
               #each   219637.2 (±23.7%) i/s -    1044648 in   5.067945s

Comparison:
               #each:   219637.2 i/s
            For loop:   149001.4 i/s - 1.47x slower

Calculating -------------------------------------
     each_with_index      8327 i/100ms
(nil)?       4739 i/100ms
-------------------------------------------------
     each_with_index   112451.6 (±17.7%) i/s -     541255 in   5.004707s
          While Loop    66624.2 (±20.8%) i/s -     312774 in   5.002312s

Comparison:
     each_with_index:   112451.6 i/s
          While Loop:    66624.2 i/s - 1.69x slower

Calculating -------------------------------------
Array#map.flatten(1)       962 i/100ms
   Array#map.flatten       765 i/100ms
      Array#flat_map      1683 i/100ms
-------------------------------------------------
Array#map.flatten(1)     9263.5 (±10.9%) i/s -      46176 in   5.059918s
   Array#map.flatten     8780.8 (±20.0%) i/s -      40545 in   5.383126s
      Array#flat_map    20494.2 (±15.1%) i/s -     100980 in   5.059322s

Comparison:
      Array#flat_map:    20494.2 i/s
Array#map.flatten(1):     9263.5 i/s - 2.21x slower
   Array#map.flatten:     8780.8 i/s - 2.33x slower

Calculating -------------------------------------
  Array#reverse.each      6622 i/100ms
  Array#reverse_each     18617 i/100ms
-------------------------------------------------
  Array#reverse.each   143393.7 (±20.1%) i/s -     682066 in   5.023382s
  Array#reverse_each   232365.7 (±18.3%) i/s -    1117020 in   5.060475s

Comparison:
  Array#reverse_each:   232365.7 i/s
  Array#reverse.each:   143393.7 i/s - 1.62x slower

Calculating -------------------------------------
Enumerable#select.first
                          4719 i/100ms
   Enumerable#detect     17371 i/100ms
-------------------------------------------------
Enumerable#select.first
                        58638.5 (±15.4%) i/s -    1141998 in  20.040349s
   Enumerable#detect   266572.4 (±20.2%) i/s -    5020219 in  20.024952s

Comparison:
   Enumerable#detect:   266572.4 i/s
Enumerable#select.first:    58638.5 i/s - 4.55x slower

Calculating -------------------------------------
Enumerable#reverse.detect
                          2239 i/100ms
Enumerable#select.last
                          3165 i/100ms
-------------------------------------------------
Enumerable#reverse.detect
                        91583.9 (±42.4%) i/s -     308982 in   5.007771s
Enumerable#select.last
                        55764.4 (±22.4%) i/s -     262695 in   5.029341s

Comparison:
Enumerable#reverse.detect:    91583.9 i/s
Enumerable#select.last:    55764.4 i/s - 1.64x slower

Calculating -------------------------------------
     Enumerable#sort       269 i/100ms
  Enumerable#sort_by       133 i/100ms
-------------------------------------------------
     Enumerable#sort     4049.3 (±21.3%) i/s -      18561 in   5.019614s
  Enumerable#sort_by     3624.0 (±32.1%) i/s -      13300 in   5.006514s

Comparison:
     Enumerable#sort:     4049.3 i/s
  Enumerable#sort_by:     3624.0 i/s - 1.12x slower

Calculating -------------------------------------
 Parallel Assignment     56941 i/100ms
Sequential Assignment
                         50420 i/100ms
-------------------------------------------------
 Parallel Assignment  5559256.8 (±17.3%) i/s -   26420624 in   4.998984s
Sequential Assignment
                      5864608.5 (±13.5%) i/s -   28588140 in   5.000221s

Comparison:
Sequential Assignment:  5864608.5 i/s
 Parallel Assignment:  5559256.8 i/s - 1.05x slower

Calculating -------------------------------------
   getter_and_setter     19147 i/100ms
       attr_accessor     22207 i/100ms
-------------------------------------------------
   getter_and_setter   472455.7 (±19.6%) i/s -    2182758 in   5.003455s
       attr_accessor   430638.3 (±20.0%) i/s -    2020837 in   5.120601s

Comparison:
   getter_and_setter:   472455.7 i/s
       attr_accessor:   430638.3 i/s - 1.10x slower

Calculating -------------------------------------
      begin...rescu
        12 i/100ms
         respond_to?     32161 i/100ms
-------------------------------------------------
      begin...rescu
      163.8 (±14.0%) i/s -        804 in   5.032624s
(nil)?    728085.0 (±20.2%) i/s -    3441227 in   5.034446s

Comparison:
         respond_to?:   728085.0 i/s
      begin...rescue:      163.8 i/s - 4444.71x slower

Calculating -------------------------------------
(nil)?      18519 i/100ms
             &method      3545 i/100ms
-------------------------------------------------
              normal   450544.0 (±28.7%) i/s -    2018571 in   5.030283s
             &method   100979.5 (±29.0%) i/s -     453760 in   5.016235s

Comparison:
              normal:   450544.0 i/s
             &method:   100979.5 i/s - 4.46x slower

Calculating -------------------------------------
              Hash[]      9261 i/100ms
            Hash#dup     10737 i/100ms
-------------------------------------------------
              Hash[]   126695.5 (±16.8%) i/s -     611226 in   5.019470s
            Hash#dup   148011.8 (±29.9%) i/s -     644220 in   5.145896s

Comparison:
            Hash#dup:   148011.8 i/s
              Hash[]:   126695.5 i/s - 1.17x slower

Calculating -------------------------------------
(nil)?      24613 i/100ms
  Hash#fetch, symbol     41334 i/100ms
     Hash#[], string     37974 i/100ms
  Hash#fetch, string     30669 i/100ms
-------------------------------------------------
     Hash#[], symbol  3710251.2 (±13.4%) i/s -   17967490 in   4.988225s
  Hash#fetch, symbol  2830311.6 (±12.6%) i/s -   13764222 in   4.997955s
     Hash#[], string  1336953.3 (±19.2%) i/s -    6303684 in   5.024627s
  Hash#fetch, string  1165595.5 (±21.0%) i/s -    5459082 in   5.045976s

Comparison:
     Hash#[], symbol:  3710251.2 i/s
  Hash#fetch, symbol:  2830311.6 i/s - 1.31x slower
     Hash#[], string:  1336953.3 i/s - 2.78x slower
  Hash#fetch, string:  1165595.5 i/s - 3.18x slower

Calculating -------------------------------------
  Hash#fetch + block     42034 i/100ms
    Hash#fetch + arg     36780 i/100ms
-------------------------------------------------
  Hash#fetch + block  1138456.6 (±33.1%) i/s -    4749842 in   5.114883s
    Hash#fetch + arg  1211750.0 (±24.4%) i/s -    5443440 in   4.998291s

Comparison:
    Hash#fetch + arg:  1211750.0 i/s
  Hash#fetch + block:  1138456.6 i/s - 1.06x slower

Calculating -------------------------------------
      Hash#keys.each     11063 i/100ms
       Hash#each_key     12089 i/100ms
-------------------------------------------------
(nil)?    132486.4 (±30.9%) i/s -     575276 in   5.005835s
       Hash#each_key   187437.5 (±16.5%) i/s -     906675 in   5.013960s

Comparison:
       Hash#each_key:   187437.5 i/s
      Hash#keys.each:   132486.4 i/s - 1.41x slower

Calculating -------------------------------------
         Hash#merge!       532 i/100ms
            Hash#[]=      1953 i/100ms
-------------------------------------------------
         Hash#merge!     6105.6 (±18.0%) i/s -      29260 in   5.005612s
            Hash#[]=    27027.1 (±17.7%) i/s -     128898 in   5.031219s

Comparison:
            Hash#[]=:    27027.1 i/s
         Hash#merge!:     6105.6 i/s - 4.43x slower

Calculating -------------------------------------
          Hash#merge        53 i/100ms
         Hash#merge!       540 i/100ms
-------------------------------------------------
          Hash#merge      569.6 (±16.9%) i/s -       2756 in   5.010399s
         Hash#merge!     5436.3 (±20.9%) i/s -      25920 in   5.102616s

Comparison:
         Hash#merge!:     5436.3 i/s
          Hash#merge:      569.6 i/s - 9.54x slower

Calculating -------------------------------------
                call      6557 i/100ms
                send     20657 i/100ms
      method_missing     18948 i/100ms
-------------------------------------------------
                call   590692.0 (±54.8%) i/s -    1265501 in   4.997544s
                send   616236.8 (±18.0%) i/s -    2809352 in   5.013711s
      method_missing   368913.2 (±22.4%) i/s -    1534788 in   5.618724s

Comparison:
                send:   616236.8 i/s
                call:   590692.0 i/s - 1.04x slower
      method_missing:   368913.2 i/s - 1.67x slower

Calculating -------------------------------------
               Block        45 i/100ms
      Symbol#to_proc        84 i/100ms
-------------------------------------------------
               Block     3057.7 (±51.4%) i/s -       8415 in   5.000573s
      Symbol#to_proc     2556.8 (±48.5%) i/s -       8232 in   5.012829s

Comparison:
               Block:     3057.7 i/s
      Symbol#to_proc:     2556.8 i/s - 1.20x slower

Calculating -------------------------------------
          block.call     25989 i/100ms
               yield     28794 i/100ms
-------------------------------------------------
          block.call  1247801.9 (±23.4%) i/s -    4548075 in   5.077983s
               yield  1350527.3 (±27.9%) i/s -    4635834 in   5.341507s

Comparison:
               yield:  1350527.3 i/s
          block.call:  1247801.9 i/s - 1.08x slower

Calculating -------------------------------------
        Range#cover?     25829 i/100ms
      Range#include?     33437 i/100ms
-------------------------------------------------
        Range#cover?  1216487.4 (±21.4%) i/s -    5398261 in   4.999387s
      Range#include?  1183796.4 (±23.0%) i/s -    5316483 in   4.998488s

Comparison:
        Range#cover?:  1216487.4 i/s
      Range#include?:  1183796.4 i/s - 1.03x slower

Calculating -------------------------------------
String#downcase + ==     26123 i/100ms
      String#casecmp     33429 i/100ms
-------------------------------------------------
String#downcase + ==   694589.0 (±16.4%) i/s -    3265375 in   5.006462s
      String#casecmp  1226840.4 (±16.8%) i/s -    5783217 in   5.009554s

Comparison:
      String#casecmp:  1226840.4 i/s
String#downcase + ==:   694589.0 i/s - 1.77x slower

Calculating -------------------------------------
            String#+     23125 i/100ms
       String#concat     26107 i/100ms
       String#append     30043 i/100ms
         "foo" "bar"     33458 i/100ms
-------------------------------------------------
            String#+   498443.3 (±20.9%) i/s -    2335625 in   5.035648s
       String#concat   643665.6 (±20.2%) i/s -    2897877 in   4.998197s
       String#append   705335.9 (±20.7%) i/s -    3274687 in   5.018724s
         "foo" "bar"  1312476.9 (±21.7%) i/s -    6089356 in   5.005494s

Comparison:
         "foo" "bar":  1312476.9 i/s
       String#append:   705335.9 i/s - 1.86x slower
       String#concat:   643665.6 i/s - 2.04x slower
            String#+:   498443.3 i/s - 2.63x slower

Calculating -------------------------------------
           String#=~      1308 i/100ms
    String#end_with?     24560 i/100ms
-------------------------------------------------
           String#=~     1428.7 (±42.2%) i/s -       6540 in   5.311828s
    String#end_with?   622754.3 (±23.7%) i/s -    2406880 in   5.032919s

Comparison:
    String#end_with?:   622754.3 i/s
           String#=~:     1428.7 i/s - 435.90x slower

Calculating -------------------------------------
         String#gsub       766 i/100ms
          String#sub      1115 i/100ms
-------------------------------------------------
         String#gsub    13619.4 (±34.6%) i/s -      54386 in   5.168455s
          String#sub    11066.9 (±50.7%) i/s -      36795 in   5.457216s

Comparison:
         String#gsub:    13619.4 i/s
          String#sub:    11066.9 i/s - 1.23x slower

Calculating -------------------------------------
         String#gsub      1171 i/100ms
           String#tr     16437 i/100ms
-------------------------------------------------
         String#gsub    10833.0 (±53.8%) i/s -      25762 in   5.004988s
           String#tr   394558.9 (±17.9%) i/s -    1873818 in   5.007815s

Comparison:
           String#tr:   394558.9 i/s
         String#gsub:    10833.0 i/s - 36.42x slower

Calculating -------------------------------------
           String#=~      6307 i/100ms
  String#start_with?     26285 i/100ms
-------------------------------------------------
           String#=~    93304.1 (±40.4%) i/s -     378420 in   5.044184s
  String#start_with?   983629.9 (±26.3%) i/s -    4363310 in   5.037172s

Comparison:
  String#start_with?:   983629.9 i/s
           String#=~:    93304.1 i/s - 10.54x slower

Calculating -------------------------------------
  String#['string']=     15430 i/100ms
 String#sub!'string'      1398 i/100ms
String#gsub!'string'       862 i/100ms
  String#[/regexp/]=      2408 i/100ms
 String#sub!/regexp/      4843 i/100ms
String#gsub!/regexp/      3062 i/100ms
-------------------------------------------------
  String#['string']=   222169.3 (±32.4%) i/s -     941230 in   5.000705s
 String#sub!'string'    19756.2 (±30.1%) i/s -      85278 in   5.278308s
String#gsub!'string'    17778.8 (±33.3%) i/s -      66374 in   5.003346s
  String#[/regexp/]=    59300.6 (±26.7%) i/s -     260064 in   5.046919s
 String#sub!/regexp/    49579.3 (±29.6%) i/s -     217935 in   5.011051s
String#gsub!/regexp/    28236.8 (±40.5%) i/s -     116356 in   5.445034s

Comparison:
  String#['string']=:   222169.3 i/s
  String#[/regexp/]=:    59300.6 i/s - 3.75x slower
 String#sub!/regexp/:    49579.3 i/s - 4.48x slower
String#gsub!/regexp/:    28236.8 i/s - 7.87x slower
 String#sub!'string':    19756.2 i/s - 11.25x slower
String#gsub!'string':    17778.8 i/s - 12.50x slower
```
