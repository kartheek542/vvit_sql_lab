import java.util.Scanner;

class array
{
  int[] a;
  Scanner sca = new Scanner(System.in);
  array(int n)
  {
    int i;
    a = new int[n];
    System.out.print("enter the elements of the array : ");
    for(i=0;i<n;i++)
    {
      String s = sca.next();
      try
      {
        a[i] = Integer.parseInt(s);
      }
      catch(Exception e)
      {
        char c = s.charAt(0);
        a[i] = c;
      }
    }
  }
  int binsearch(int k,int l,int u)
  {
    if(l>u)
    return -1;
    int m = (l+u)/2;
    if(this.a[m] == k)
    return m;
    else if(this.a[m] > k)
    return this.binsearch(k,l,m-1);
    else
    return this.binsearch(k,m+1,u);
  }
  int fibsearch(int k,int l,int u)
  {
    if(l>u)
    return -1;
    int[] f = new int[]{0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181};
    int x = 0;
    int y = u-l;
    int i = 0;
    while(f[i]<=y)
    i++;
    int s = f[i-1];
    if(this.a[s+l] == k)
    return s+l;
    else if(this.a[s+l] < k)
    return this.fibsearch(k,l+s+1,u);
    else
    return this.fibsearch(k,l,l+s-1);

  }
}
public class search
{
  public static void main(String[] args)
  {
    Scanner sc = new Scanner(System.in);
    System.out.print("enter the no of elements in the array : ");
    int n = sc.nextInt();
    array arr = new array(n);
    System.out.print("enter the element you want to search : ");
    String s = sc.next();
    int key;
    try
    {
      key = Integer.parseInt(s);
    }
    catch(Exception e)
    {
      char c = s.charAt(0);
      key = c;
    }
    int pos;
    System.out.println("select the type of search ou would like to perform");
    System.out.println("1.Binary Search");
    System.out.println("2.Fibonaci Search");
    System.out.print("enter your choice : ");
    int choice = sc.nextInt();
    if(choice == 1)
    {
      System.out.println("you chose Binary Search");
      pos = arr.binsearch(key,0,n-1);
      if(pos != -1)
      System.out.println("key found at "+pos);
      else
      System.out.println("key not found");
    }
    else if(choice == 2)
    {
      System.out.println("you chose Fibonacci Search");
      pos = arr.fibsearch(key,0,n-1);
      if(pos == -1)
      System.out.println("key not found");
      else
      System.out.println("key found at "+pos);
    }
    else
    System.out.println("OOPS..!! You didn't entered a valid choice");
  }
}
