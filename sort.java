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
  void selection_sort()
  {
    int n = this.a.length;
    int i,j;
    for(i=0;i<n-1;i++)
    {
      int min = i;
      for(j=i;j<n;j++)
      {
        if(this.a[min]>a[j])
        min = j;
      }
      int temp = this.a[i];
      this.a[i] = this.a[min];
      this.a[min] = temp;
    }
  }
  void insertion_sort()
  {
    int n = this.a.length;
    int i,j;
    for(i=1;i<n;i++)
    {
      int temp = this.a[i];
      for(j=i;j>0;j--)
      {
        if(temp<this.a[j-1])
        {
          this.a[j] = this.a[j-1];
        }
        else
        {
          break;
        }
      }
      this.a[j] = temp;
    }
  }
  void display(int t)
  {
    int i;
    System.out.print("the elements are : ");
    if(t==1)
    {
      for(i=0;i<this.a.length;i++)
      System.out.print(this.a[i]+" ");
    }
    else if(t==2)
    {
      for(i=0;i<this.a.length;i++)
      System.out.print((char)this.a[i]+" ");
    }
    System.out.println("");
  }
}
public class sort
{
  public static void main(String[] args)
  {
    Scanner sc = new Scanner(System.in);
    System.out.println("enter the type of elements in the array");
    System.out.println("1.int");
    System.out.println("2.char");
    System.out.print("enter your choice : ");
    int t = sc.nextInt();
    System.out.print("enter the no of elements in the array : ");
    int n = sc.nextInt();
    array arr = new array(n);
    arr.insertion_sort();
    arr.display(t);
  }
}
