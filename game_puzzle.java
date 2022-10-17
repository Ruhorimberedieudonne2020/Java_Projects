import java.io.*;
import java.lang.*;
import java.awt.Graphics;
import java.awt.*;
import java.applet.*;
import java.awt.event.*;
import java.lang.String;
import javax.swing.*;


/*
<applet code="game_puzzle.class" width =450 height=400>
</applet>
*/

public class game_puzzle extends JApplet implements ActionListener, KeyListener
{
	private MyButton[] button;
	private JLabel label1,label2,label3,label4;
	private JTextField textf1,textf2;
	private String[] Strbutton={
	"7","8","4","3","6","1","2","5","     ","Start","Restart","Finish"};
	private String[] Strbutton1={
		"1","2","3","4","5","6","7","8"," "};
	private int click_count;// Counts the number of clicks by the player. 
	GridBagLayout grid = new GridBagLayout();
	GridBagConstraints gbc1 = new 
	GridBagConstraints();	
	JPanel pan1,pan2;
	String str1="";
	
	public void init()// To initialise different variables.
	{
		label1 = new JLabel("Puzzle");  //Initialising the labels.
		label1.setFont(new Font("Times  Roman" , Font.BOLD,20));
		label1.setForeground(Color.blue);
		label2=new JLabel("Name of the Player");
		label2.setFont(new Font("Times  Roman" ,Font.BOLD,15));
		label2.setForeground(Color.blue);
		label3=new JLabel("Number of the Clicks");
		label3.setFont(new Font("Times Roman",Font.BOLD,15));
		label3.setForeground(Color.blue);
		label4=new JLabel ( "                                     ");
		button =new MyButton[12];
		for(int i=0;i<12;i++)//Creating the advanced buttons like sin & cos & arcsin etc.
		{
			button[i]= new MyButton ( Strbutton[i],Color.black);
			button[i].addActionListener(this);
		}	
		textf1=new JTextField(20);
		textf2=new JTextField(20);
		textf1.setFont(new Font("Times Roman",Font.BOLD,12));
		textf2.setFont(new Font("Times Roman",Font.BOLD,12));
		textf1.setText("");
		textf1.addKeyListener(this);
		textf2.setText("");
		click_count=0;//Initialise the clicks to zero.
		displayPanel();// Method displayPanel() //is invoked. 
	} //End of init() method.

	class MyButton extends JButton
	{
		public MyButton(String name, Color xyz) 
		{
			this.setLabel(name);
			this.setForeground(xyz);
		}
		
		class MouseCalcButtonAdapter extends MouseAdapter
		{
			public void mouseEntered(MouseEvent me){}

			public void mouseExited(MouseEvent me){}
		}
	}
	public void keyTyped(KeyEvent e)//Denotes a key press followed by a key release.
 	{
		char ch;
		ch=e.getKeyChar();
		str1 = str1 + ch;
			
	}
	public void keyPressed(KeyEvent e)//Indicates  a key is pushed down.
	{
	}
	public void keyReleased(KeyEvent e)//Indicates  a key is Released.
	{
	}
		
	public void actionPerformed(ActionEvent ae) //Provide the functioning to the game.
	{
		int index=8,i;
		String str,temp,count;
		boolean check;
		
		for(i=0;i<9;i++)
		{ 
			if(button[i].getLabel()==" ")
				index=i;// For checking which button contains the blank  label. 
		}		
		if(ae.getSource()==button[9])// For enabling the button after the button start is clicked.
		{
			for(int j=0;j<=8;j++)
				button[j].setEnabled(true);
				button[9].setEnabled(false); //Disable the start button.	
		}
		
		
		if(ae.getSource()==button[10])
				//Restart button.
		{
				for(i=0;i<9;i++)
				{
					button[i].setEnabled(true);
					button[i].setLabel(Strbutton[i]);
				}
				click_count=0;	
				textf2.setText("0");
		}
		
		if((ae.getSource() != button[9]) || (ae.getSource() != button[10]) )
		{
			check=checkStatus();
			
				
		if(check==false)// Check whether the number is arranged in the correct order.
		{
			if (ae.getSource() == button[0])
			{
				count=Integer.toString(countClicks());
				textf2.setText(count);
				if (index==1||index==3)
				{
					str=button[0].getLabel();			
					button[0].setLabel(" ");	
					button[index].setLabel (str);
				}
			}		
			if (ae.getSource()== button[1])
			{
				count=Integer.toString(countClicks());
				textf2.setText(count);
				if (index==0|| index==4 ||index==2)
				{
					str=button[1].getLabel();
					button[1].setLabel (" ");	
					button[index]. setLabel(str);
				}
			}
			if (ae.getSource()== button[2])
			{
				count=Integer.toString(countClicks());
				textf2.setText(count);
				if (index==1||index==5)
				{
					str=button[2]. getLabel();		
					button[2].setLabel(" ");	
					button[index]. setLabel(str);
				}
			}		
			if (ae.getSource()== button[3])
			{
				count=Integer.toString(countClicks());
				textf2.setText(count);
				if (index==0||index==4 ||index==6)
				{
					str=button[3].getLabel();			
					button[3].setLabel(" ");	
					button[index].setLabel(str);
				}
			}	
			if (ae.getSource()==button[4])
			{
				count=Integer.toString(countClicks());
				textf2.setText(count);				
				if (index==1||index==3 ||index==5||index==7)
				{
					str=button[4]. getLabel();		
					button[4].setLabel(" ");	
					button[index].setLabel(str);
				}
			}	
			if (ae.getSource()==button[5])
			{
				count=Integer.toString(countClicks());
				textf2.setText(count);
				if (index==2||index==4 ||index==8)
				{
					str=button[5]. getLabel();		
					button[5].setLabel(" ");	
					button[index].setLabel(str);
				}
			}	
			if (ae.getSource()==button[6])
			{
				count=Integer.toString(countClicks());
				textf2.setText(count);
				if (index==3||index==7)
				{
					str=button[6].getLabel();		
					button[6].setLabel(" ");	
					button[index].setLabel(str);
				}
			}	
			if (ae.getSource()==button[7])
			{
				count=Integer.toString(countClicks());
				textf2.setText(count);
				if (index==6||index==4 ||index==8)
				{	
					str=button[7]. getLabel();		
					button[7].setLabel(" ");	
					button[index].setLabel(str);
				}
			}	
			if (ae.getSource()==button[8])//Exit button.
			{
				count=Integer.toString(countClicks());
				textf2.setText(count);
				if (index==5||index==7)
				{
					str=button[8]. getLabel();		
					button[8].setLabel(" ");	
					button[index]. setLabel(str);
				}
			}
			if(ae.getSource()==button[10])
				//Restart button.
			{
				for(i=0;i<9;i++)
				{
					button[i].setEnabled(true);
					button[i].setLabel(Strbutton[i]);
				}
				click_count=0;	
				textf2.setText("0");
			}	
			if (ae.getSource()==button[11])
			//Finish button.
			{
				for(i=0;i<=8;i++)
				{
					button[i].setLabel (Strbutton1[i]);
				}
				click_count=0;
				textf2.setText("0");		
				button[11].setEnabled(false);
				button[10].setEnabled(false);
		 	}	
		}
		else//If the game is completed.
		{
			
			String st = str1 + ", you have won the game.";
			for (int j=0;j<=8;j++)
 				button[j].setEnabled(false);
 				JOptionPane.showMessageDialog(null,st);
 			
		}
	}
	}//End of actionPerformed() method.
	
	void displayPanel()// Designing the layout.
	{
		JPanel pa4 = new JPanel(); 
		pan1 = new JPanel(); // Creating the main panel on which all the component will be  placed.
		
		// Setting the colour for the interface.
		pan1.setLayout(grid); // Setting the layout as grid bag layout. 			
		gbc1.weightx = 100;    
		gbc1.weighty = 100;   
		gbc1.ipady = 0; //Height of Component.				
		gbc1.ipadx = 0; //Width of Component.
   		gbc1.gridwidth =1;   			
     	gbc1.gridheight=1;
     	 gbc1.gridx = 0;
     	 gbc1.gridy = 0;       	  	
     	 grid.setConstraints(label1, gbc1);
		pan1.add(label1);// Attaching the label //label1 on the panel pan1. 

		gbc1.weightx=100;			
		gbc1.weighty = 100;   	 	
		gbc1.ipady = 5;//Height of Component.
		gbc1.ipadx = 5;  //Width of Component.
      	gbc1.gridwidth =1;   	  
     	gbc1.gridheight=1;
      	gbc1.gridx = 1;       	  
      	gbc1.gridy = 0;       	  
      	grid.setConstraints(button[9], gbc1);
		pan1.add(button[9]);
	
		gbc1.weightx=100;			
		gbc1.weighty = 100;//Vertical Space.	
		gbc1.ipady = 0; //Height of Component.
		gbc1.ipadx = 0; 		  
    	gbc1.gridwidth =1;   	  
		gbc1.gridheight=2;
		gbc1.gridx = 0;       	  
		gbc1.gridy = 2;       	  
		grid.setConstraints(label2, gbc1);
		pan1.add(label2);
			
		gbc1.weightx=100;			
		gbc1.weighty = 100;   	
		gbc1.ipady = 0;       				
		gbc1.ipadx = 0; 		  
		gbc1.gridwidth =1;   	  
		gbc1.gridheight=2;
		gbc1.gridx = 1;       	  
 	 	gbc1.gridy = 2;       	  
					
		grid.setConstraints(textf1, gbc1);
		pan1.add(textf1);
		gbc1.weightx = 100;    
		gbc1.weighty = 100;   
		gbc1.ipady = 0;       				
		gbc1.ipadx = 0;       						
        gbc1.gridwidth =1 ;   						
        gbc1.gridheight=2;
        gbc1.gridx = 0;       			 
  		gbc1.gridy = 4;       						
		pa4.setLayout(new GridLayout(3,3,5,5));
	  	for(int i=0;i<9;i++)
		{
			pa4.add(button[i]); 
			button[i].setEnabled(false);
	  	}	
	  	grid.setConstraints(pa4, gbc1);		
	  	pan1.add(pa4);
	
  		gbc1.weightx=100;			
	  	gbc1.weighty=100;   	  
	  	gbc1.ipady = 0;       	  
	  	gbc1.ipadx = 0; 		  
	  	gbc1.gridwidth =1;
	  	gbc1.gridheight=1;
	  	gbc1.gridx = 0;   
	  	gbc1.gridy = 6;   
					
	 	grid.setConstraints(label3, gbc1);
		pan1.add(label3);
		gbc1.ipady = 0;       				
		gbc1.ipadx = 0;       				
    	
		gbc1.weightx = 100;
    	gbc1.weighty = 100;   				
     	gbc1.gridwidth =1 ;
      	gbc1.gridheight=1;   				
		gbc1.gridx = 1;       				
      	gbc1.gridy = 6;       						
    	grid.setConstraints(textf2, gbc1);
		pan1.add(textf2);		
		    		    
		gbc1.ipady = 5;       				
		gbc1.ipadx = 5;       				
    	gbc1.weighty = 100;
    	gbc1.weightx = 100;   				
    	gbc1.gridwidth =1;
		gbc1.gridheight=1;   						
		gbc1.gridx = 0;       				
		gbc1.gridy = 7;       				
		grid.setConstraints(button[10], gbc1);
      	pan1.add(button[10]);				
		gbc1.ipady = 5;       				
		gbc1.ipadx = 5;       				
		gbc1.weighty = 100;
		gbc1.weightx = 100;   				
		gbc1.gridwidth =1;
		gbc1.gridheight=1;   				
		gbc1.gridx = 1;       				
		gbc1.gridy = 7;       				
		grid.setConstraints(button[11], gbc1);
		pan1.add(button[11]);
		gbc1.ipady = 0;       				
		gbc1.ipadx = 0;       			
		gbc1.weighty = 100;
		gbc1.weightx = 100;   				
		gbc1.gridwidth =1;    
		gbc1.gridheight=1;   			
		gbc1.gridx = 0;       			
		gbc1.gridy = 8;       					
		grid.setConstraints(label4, gbc1);
		pan1.add(label4);
		gbc1.ipady = 5;       				
		gbc1.ipadx = 5;       						

		
		getContentPane().add(pan1);			
	}// End of the method displayPanel().

	public int countClicks()// For incrementing the clicks counter. 
	{
		
		return(++click_count);
	}//End countClicks() method.

	public boolean checkStatus()// To check  the game is finish or not.
	{
		int i;
		if (button[0].getLabel() == "1" && 
		button[1].getLabel() == "2"&&
		button[2].getLabel() == "3" && 
		button[3].getLabel() == "4"&&
		button[4].getLabel() == "5" && 
		button[5].getLabel() == "6"&&
		button[6].getLabel() == "7" && 
		button[7].getLabel() == "8"&&
		button[8].getLabel() == " ")
		{
				return(true);
		}
		else		
			return(false);         
	}//End checkStatus() method.


	
	
} // End of game_puzzle class.




	
	