
import sys


def timespow_2(x, b):
    """
	Returns x * 2**b
    """
    return x << b    


if __name__ == '__main__':

	result = timespow_2(3, 2)   # = 12
	result += timespow_2(2, 3)  # = 16
	
	print("Python:", result)