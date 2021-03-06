global with sharing class AndPredicate implements IPredicate {
  private List<IPredicate> predicates = new List<IPredicate>();

  global static AndPredicate NewInstance() {
    return new AndPredicate();
  }

  global static AndPredicate NewInstance(IPredicate p1, IPredicate p2) {
    AndPredicate p = AndPredicate.NewInstance();
    p.Append(p1);
    p.Append(p2);
    return p;
  }
  global static AndPredicate NewInstance(IPredicate p1, IPredicate p2, IPredicate p3) {
    AndPredicate p = AndPredicate.NewInstance(p1, p2);
    p.Append(p3);
    return p;
  }
  global static AndPredicate NewInstance(IPredicate p1, IPredicate p2, IPredicate p3, IPredicate p4) {
    AndPredicate p = AndPredicate.NewInstance(p1, p2, p3);
    p.Append(p4);
    return p;
  }
  global static AndPredicate NewInstance(IPredicate p1, IPredicate p2, IPredicate p3, IPredicate p4, IPredicate p5) {
    AndPredicate p = AndPredicate.NewInstance(p1, p2, p3, p4);
    p.Append(p5);
    return p;
  }
  global static AndPredicate NewInstance(IPredicate[] ps) {
    AndPredicate pred = AndPredicate.NewInstance();
    for (IPredicate p : ps) {
      pred.Append(p);
    }
    return pred;
  }

  global AndPredicate Append(IPredicate p) {
    predicates.add(p);
    return this;
  }
  
  override global String toString() {
    String toReturn = '(';
    
    Boolean firstPredicate = true;
    for (IPredicate predicate: predicates) {
      if (!firstPredicate) {
        toReturn += ' AND ';
      }
      firstPredicate = false;
      toReturn += String.valueOf(predicate); // Classes that extend BasicPredicate override toString()
    }
    toReturn += ')';

    return toReturn;
  }
}
