
# coding: utf-8

# In[53]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# In[54]:


df = pd.read_csv('hw1_data.csv')
df


# In[55]:


df['%profit']=df.revenue/df.budget
df['%profit'].fillna(0, inplace=True)
df


# In[56]:


df = df[df.budget!=0]
df = df[df.revenue!=0]
df


# In[63]:


data = pd.DataFrame(df.groupby('genres')['vote_average','budget','%profit','runtime','revenue'].apply(np.mean))
data = data.sort_values(by='%profit',ascending=False)
data = data.astype(float)
data


# In[58]:


f = plt.figure()
plt.ticklabel_format(style = 'plain')
data.plot(kind='bar',y='budget', ax=f.gca())


# In[59]:


f = plt.figure()
plt.ticklabel_format(style = 'plain')
data.plot(kind='bar',y='%profit', ax=f.gca())


# In[60]:


f = plt.figure()
plt.ticklabel_format(style = 'plain')
data.plot(kind='bar',y='vote_average', ax=f.gca())


# In[61]:


f = plt.figure()
plt.ticklabel_format(style = 'plain')
data.plot(kind='bar',y='runtime', ax=f.gca())


# In[62]:


f = plt.figure()
plt.ticklabel_format(style = 'plain')
data.plot(kind='bar',y='revenue', ax=f.gca())

