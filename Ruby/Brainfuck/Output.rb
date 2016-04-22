memoire = Array.new(256, 0)
pointeur = 0
memoire[pointeur] += 11
pointeur += 1
memoire[pointeur] += 1
pointeur += 4
memoire[pointeur] += 44
pointeur += 1
memoire[pointeur] += 32
pointeur -= 6
while (memoire[pointeur] != 0)
pointeur += 1
while (memoire[pointeur] != 0)
pointeur += 6
memoire[pointeur] += 1
pointeur += 1
memoire[pointeur] += 1
pointeur -= 7
memoire[pointeur] -= 1
end
pointeur += 7
while (memoire[pointeur] != 0)
pointeur -= 7
memoire[pointeur] += 1
pointeur += 7
memoire[pointeur] -= 1
end
pointeur -= 1
while (memoire[pointeur] != 0)
pointeur += 1
memoire[pointeur] += 10
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
pointeur -= 1
memoire[pointeur] -= 1
while (memoire[pointeur] != 0)
pointeur += 2
memoire[pointeur] += 1
pointeur += 1
memoire[pointeur] += 1
pointeur -= 3
memoire[pointeur] -= 1
end
pointeur += 3
while (memoire[pointeur] != 0)
pointeur -= 3
memoire[pointeur] += 1
pointeur += 3
memoire[pointeur] -= 1
end
memoire[pointeur] += 1
pointeur -= 1
while (memoire[pointeur] != 0)
pointeur += 1
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
end
pointeur -= 1
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
end
end
pointeur += 1
while (memoire[pointeur] != 0)
pointeur -= 2
while (memoire[pointeur] != 0)
pointeur += 3
memoire[pointeur] += 1
pointeur -= 3
memoire[pointeur] -= 1
end
pointeur += 2
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
end
end
pointeur -= 2
end
pointeur += 3
while (memoire[pointeur] != 0)
pointeur += 2
memoire[pointeur] += 1
pointeur += 1
memoire[pointeur] += 1
pointeur -= 3
memoire[pointeur] -= 1
end
pointeur += 3
while (memoire[pointeur] != 0)
pointeur -= 3
memoire[pointeur] += 1
pointeur += 3
memoire[pointeur] -= 1
end
memoire[pointeur] += 1
pointeur -= 1
while (memoire[pointeur] != 0)
pointeur += 1
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
end
pointeur -= 1
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
end
end
pointeur += 1
while (memoire[pointeur] != 0)
pointeur -= 2
memoire[pointeur] += 1
pointeur += 2
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
end
end
pointeur -= 7
end
pointeur += 5
while (memoire[pointeur] != 0)
memoire[pointeur] += 25
memoire[pointeur] += 23
1.times{print memoire[pointeur].chr}
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
end
end
memoire[pointeur] += 10
pointeur -= 1
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
pointeur += 1
memoire[pointeur] -= 1
pointeur -= 1
end
pointeur += 1
memoire[pointeur] += 4
memoire[pointeur] += 44
1.times{print memoire[pointeur].chr}
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
end
pointeur -= 2
pointeur -= 10
while (memoire[pointeur] != 0)
pointeur += 3
memoire[pointeur] += 1
pointeur += 1
memoire[pointeur] += 1
pointeur -= 4
memoire[pointeur] -= 1
end
pointeur += 4
while (memoire[pointeur] != 0)
pointeur -= 4
memoire[pointeur] += 1
pointeur += 4
memoire[pointeur] -= 1
end
pointeur -= 1
memoire[pointeur] -= 1
while (memoire[pointeur] != 0)
pointeur += 2
1.times{print memoire[pointeur].chr}
pointeur += 1
1.times{print memoire[pointeur].chr}
pointeur -= 3
while (memoire[pointeur] != 0)
memoire[pointeur] -= 1
end
end
pointeur -= 2
while (memoire[pointeur] != 0)
pointeur += 2
memoire[pointeur] += 1
pointeur += 1
memoire[pointeur] += 1
pointeur -= 3
memoire[pointeur] -= 1
end
pointeur += 3
while (memoire[pointeur] != 0)
pointeur -= 3
memoire[pointeur] += 1
pointeur += 3
memoire[pointeur] -= 1
end
pointeur -= 2
while (memoire[pointeur] != 0)
pointeur -= 1
memoire[pointeur] += 1
pointeur += 1
memoire[pointeur] -= 1
end
pointeur += 1
while (memoire[pointeur] != 0)
pointeur -= 1
memoire[pointeur] += 1
pointeur += 1
memoire[pointeur] -= 1
end
pointeur -= 3
memoire[pointeur] -= 1
end
