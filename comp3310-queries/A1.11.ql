import java

from Method m1, Method m2, MethodAccess ma1, MethodAccess ma2
where
    (m1.getName() = "println" and
    m1.getDeclaringType().hasQualifiedName("java.io", "PrintStream") and
    ma1.getMethod() = m1 and
    m2.getName() = "getMessage" and
    m2.getDeclaringType().hasQualifiedName("java.lang", "Throwable") and
    m2.getDeclaringType().getName() = "Throwable" and
    ma2.getMethod() = m2 and
    ma1.getAChildExpr() = ma2)
    
    or

    (m1.getName() = "printStackTrace" and
    m1.getDeclaringType().getName() = "Throwable" and 
    ma1.getMethod() = m1 and
    ma1.getNumArgument() = 0)
select ma1, "Method access to println with descendant method getMessage() of a Throwable or method access to printStackTrace of a throwable with no arguments"
