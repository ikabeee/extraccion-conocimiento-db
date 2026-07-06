
for(i in 1:10) {
    cat("La tabla del", i, "es:\n")
    for(j in 1:10) {
        print(i * j)
    }
}


print("Tabla de multiplicar completa:")
for(i in 1:10) {
    for(j in 1:10) {
        cat(i * j, "\t")
    }
    cat("\n")
}