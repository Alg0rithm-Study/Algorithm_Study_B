N, M = list(map(int, input().split()))
trees = list(map(int, input().split()))

left, right = 0, max(trees)
answer = 0

def cut(height):
    total = 0
    for t in trees:
        if t > height:
            total += t - height
    return total
answer = 0
while left <= right:
    height = left + (right - left) // 2
    cutDif = cut(height)
    if cutDif >= M:
        answer = max(height, answer)
        left = height + 1
    else:
        right = height - 1
print(answer)
