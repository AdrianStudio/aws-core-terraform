import boto3

cliente_ec2 = boto3.client('ec2', region_name='eu-west-1')
cliente_s3 = boto3.client('s3', region_name='eu-west-1')

def lista_ec2():
    respuesta = cliente_ec2.describe_instances()
    for reserva in respuesta['Reservations']:
        for instancia in reserva['Instances']:
            print(instancia['InstanceId'], instancia['State']['Name'])

def describir_s3():
    respuesta = cliente_s3.list_buckets()
    for bucket in respuesta['Buckets']:
        print(bucket['Name'], bucket['CreationDate'])

def subir_objeto():
    cliente_s3.upload_file('/tmp/test.txt', 'aws-terraform-dev-adrian', 'test.txt')
    print('Archivo subido')

if __name__ == "__main__":
    print("=== EC2 Instances ===")
    lista_ec2()
    print("\n=== S3 Buckets ===")
    describir_s3()
    print("\n=== Uploading test object ===")
    subir_objeto()
