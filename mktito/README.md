# mktito

## Description
Partition LTI plant P for robust controller synthesis. If a plant is partitioned this way, one can omit the inputs nmeas and ncon when calling the functions hinfsyn and h2syn.
```
 min||N(K)||             N = lft (P, K)
  K         norm

                +--------+  
   w = u1 ----->|        |-----> z = y1
                |  P(s)  |
   u = u2 +---->|        |-----+ y = y2
          |     +--------+     |
          |                    |
          |     +--------+     |
          +-----|  K(s)  |<----+
                +--------+

                +--------+      
   w = u1 ----->|  N(s)  |-----> z = y1
                +--------+
```
Reference: [1] Skogestad, S. and Postlethwaite, I. (2005) Multivariable Feedback Control: Analysis and Design: Second Edition. Wiley, Chichester, England.

## Calling Sequence
- `P_out = mktito (P, nmeas, ncon)`

## Parameters
- `P_out` (State-space/Transfer function): Partitioned plant. The input/output groups and names are overwritten with designations according to [1].
- `P` (State-space/Transfer function): Generalized plant.
- `nmeas` (Real scalar): Number of measured outputs v. The last nmeas outputs of P are connected to the inputs of controller K. The remaining outputs z (indices 1 to p-nmeas) are used to calculate the H-2/H-infinity norm.
- `ncon` (Real scalar): Number of controlled inputs u. The last ncon inputs of P are connected to the outputs of controller K. The remaining inputs w (indices 1 to m-ncon) are excited by a harmonic test signal.

## Dependencies
[@lti/size](https://github.com/akash-sankar/CSToolboxFunctions/tree/main/%40lti%20size)

## Examples
1.
```
```

```
```

2.
```
```

```
```

3.
```
```

```
```

4.
```
```

```
```

5.
```
```

```
```
