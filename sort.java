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
  void merge_sort(int l,int u)
  {
    if(l<u)
    {
      int mid = (l+u)/2;
      this.merge_sort(l,mid);
      this.merge_sort(mid+1,u);
      this.merge(l,mid,u);
    }
  }
  void merge(int l,int m,int u)
  {
    int n1 = m-l+1;
    int n2 = u-m;
    int[] x = new int[n1];
    int[] y = new int[n2];
    int i;
    int temp =l;
    for(i=0;i<n1;i++)
    {
      x[i] = this.a[temp];
      temp++;
    }
    temp = m+1;
    for(i=0;i<n2;i++)
    {
      y[i] = this.a[temp];
      temp++;
    }
    int p1 = 0;
    int p2 = 0;
    int k = l;
    while((p1<n1)&&(p2<n2))
    {
      if(x[p1]<y[p2])
      {
        this.a[k] = x[p1];
        p1++;
      }
      else
      {
        this.a[k] = y[p2];
        p2++;
      }
      k++;
    }
    while(p1<n1)
    {
      this.a[k] = x[p1];
      p1++;
      k++;
    }
    while(p2<n2)
    {
      this.a[k] = y[p2];
      p2++;
      k++;
    }
  }
  int partition(int l,int u)
  {
    int piv = l;
    int r1=l;
    int r2=l+1;
    int i=l+1;
    while(i<=u)
    {
      if(this.a[piv] < this.a[i])
      {
        r2++;
      }
      else
      {
        int temp = this.a[r1+1];
        this.a[r1+1] = this.a[i];
        this.a[i] = temp;
        r1++;
        r2++;
      }
      i++;
    }
    int temp = this.a[r1];
    this.a[r1] = this.a[l];
    this.a[l] = temp;
    return r1;
  }
  void quicksort(int l,int u)
  {
    if(l<u)
    {
      int p = this.partition(l,u);
      this.quicksort(l,p-1);
      this.quicksort(p+1,u);
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
    arr.quicksort(0,n-1);
    arr.display(t);
  }
}
